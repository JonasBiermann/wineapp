import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/introduction_screens/introduction_screen_3.dart';
import 'package:wineapp/screens/introduction_screens/introduction_screen_4.dart';
import 'package:wineapp/data/globals.dart' as globals;

class IntroductionScreen2 extends StatelessWidget {
  const IntroductionScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 50,
            top: 184,
            child: SizedBox(
              height: 232.23,
              width: 300,
              child: globals.currentTheme
                  ? SvgPicture.asset(
                      'assets/icons/icons_purple/special_event_purple.svg')
                  : SvgPicture.asset(
                      'assets/icons/icons_red/special_event_red.svg'),
            ),
          ),
          Positioned(
            left: 37,
            top: 430,
            child: SizedBox(
              height: 84,
              width: 316,
              child: Text(
                'Get wine suggestions anywhere',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 28,
            top: 529,
            child: SizedBox(
              width: 334,
              height: 42,
              child: Text(
                'No matter where you are, your personal somellier will always give you a suggestion.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 160,
            top: 646,
            child: SizedBox(
              height: 10,
              width: 70,
              child: globals.currentTheme
                  ? SvgPicture.asset(
                      'assets/icons/icons_purple/dot_Indicator_2_purple.svg')
                  : SvgPicture.asset(
                      'assets/icons/icons_red/dot_indicator_2_red.svg'),
            ),
          ),
          Positioned(
            left: 98,
            top: 771,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  createRoute(
                    const IntroductionScreen4(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 202,
            top: 755,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  createRoute(
                    const IntroductionScreen3(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 153,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    left: 248 - 202,
                    top: 768 - 755,
                    child: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 291 - 202,
                    top: 775 - 755,
                    child: SizedBox(
                      height: 11.37,
                      width: 18,
                      child: SvgPicture.asset(
                          'assets/icons/general/arrow_right.svg',
                          color: Theme.of(context).indicatorColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
