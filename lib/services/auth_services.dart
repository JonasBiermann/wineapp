import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //Register User

  Future<User?> emailRegister(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    } catch (e) {
      print(e);
    }
    return null;
  }

  //User login
  Future<User?> emailLogin(
      String email, String password, BuildContext context) async {
    try {} on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }

    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  //User SignIn with Google
  Future<User?> signInWithGoogle() async {
    try {
      //Triger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        //Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        //Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        //Once signed in, return the UserCredential
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
    return null;
  }

  //Sign Out function
  Future logOut() async {
    await GoogleSignIn().signOut();
    await firebaseAuth.signOut();
    print('logged out');
  }

  Future<void> addUser(username, email, age, language, DateTime dateAdded) {
    return firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid.toString())
        .set({
          'username': username,
          'email': email,
          'age': age,
          'language': language,
          'dateAdded': dateAdded,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
