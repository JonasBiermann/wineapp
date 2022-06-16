import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/screens/home/main_screen.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/data/globals.dart' as globals;

class SomellierResultScreen extends StatelessWidget {
  const SomellierResultScreen({Key? key}) : super(key: key);

  addActivity() async {
    final documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('activity')
        .doc('${globals.year}')
        .collection('week${globals.week}')
        .doc((DateTime.now().weekday).toString())
        .set({'usage': FieldValue.increment(1)}, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeScreenHeader(
            subText: 'Wine',
            mainText: 'Somelliers Choice',
            boxWidth: 203,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 159,
              top: 92,
              right: 159,
            ),
            child: Text(
              'Ready🎉',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 37,
              right: 37,
            ),
            child: Text(
              'This wine would be a perfect fit for your meal',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              top: 25,
            ),
            child: Container(
              height: 185,
              width: 320,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 143,
              right: 143,
              top: 35,
            ),
            child: Text(
              'Not Available?',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 92,
              right: 92,
              top: 5,
            ),
            child: Text(
              'No Problem - We got you covered',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              top: 211,
            ),
            child: GestureDetector(
              onTap: () {
                addActivity();
                print(DateTime.now().weekday);
                Navigator.pushAndRemoveUntil(context,
                    createRoute(MainScreen(pageIndex: 0)), (route) => false);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    'Add to Profile 🍷',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

getNumber(day) {
  switch (day) {
    case 'Monday':
      return 0;
    case 'Tuesday':
      return 1;
    case 'Wednesday':
      return 2;
    case 'Thursday':
      return 3;
    case 'Friday':
      return 4;
    case 'Saturday':
      return 5;
    case 'Sunday':
      return 6;
  }
}
