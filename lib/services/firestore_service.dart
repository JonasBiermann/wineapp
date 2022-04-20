import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wineapp/data/globals.dart' as globals;

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addCollection() {
    return firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('activity')
        .doc('${globals.year}')
        .collection('week16')
        .doc('monday')
        .set({'time': DateTime.now()});
  }
}
