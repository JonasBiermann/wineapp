import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';

class SomellierResultScreen extends StatelessWidget {
  const SomellierResultScreen({Key? key}) : super(key: key);

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
              onTap: () {},
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
