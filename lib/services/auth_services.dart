import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:wineapp/constants.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: primaryColor,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  //User login
  Future<User?> emailLogin(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
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
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: primaryColor,
        ),
      );
    }
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
    } on FirebaseAuthException catch (e) {
      print(
        e.toString(),
      );
    }
    return null;
  }

  //Sign Out function
  Future googleSignOut() async {
    await GoogleSignIn().signOut();
    await firebaseAuth.signOut();
  }

  void twitterLogin() async {
    try {
      final twitterLogin = TwitterLogin(
          apiKey: '0j8FZRhF9qHkkS2u9Zt7COoJm',
          apiSecretKey: 'Vc6yeYcK3xB4Vd0lRHD5kvrq0a5srEnk8r5liLrU3WRHhmg2Dc',
          redirectURI: 'flutter-twitter-login://');
      await twitterLogin.login().then((value) async {
        if (value.authToken != null || value.authTokenSecret != null) {
          final twitterAuthCredentials = TwitterAuthProvider.credential(
            accessToken: value.authToken!,
            secret: value.authTokenSecret!,
          );

          await firebaseAuth.signInWithCredential(twitterAuthCredentials);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
