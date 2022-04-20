import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/data/somellier_data.dart';
import 'package:wineapp/data/globals.dart' as globals;

class SomellierActivity extends StatefulWidget {
  const SomellierActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<SomellierActivity> createState() => _SomellierActivityState();
}

class _SomellierActivityState extends State<SomellierActivity> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: 465,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 320,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: Offset(
                    0,
                    6,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 62 - 35,
            top: 480 - 465,
            child: SizedBox(
              height: 30,
              width: 178,
              child: Text(
                'Somellier Activity',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 79 - 35,
            top: 521 - 465,
            child: SizedBox(
              height: 125,
              width: 232.26,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                      .collection('activity')
                      .doc('${globals.year}')
                      .collection('week${globals.week}')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('An error occurred');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }
                    print(FirebaseAuth.instance.currentUser!.uid);
                    return SomellierChart(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      textColor: Theme.of(context).indicatorColor,
                      queryDocumentSnapshot: snapshot.data!.docs,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
