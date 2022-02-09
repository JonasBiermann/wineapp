import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/introduction_screens/pick_language_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/register_screen.dart';

class IntroductionScreen4 extends StatelessWidget {
  const IntroductionScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 45,
            top: 146,
            child: SizedBox(
              width: 300,
              height: 254.47,
              child: SvgPicture.asset('assets/icons/histroy.svg'),
            ),
          ),
          Positioned(
            left: 37,
            top: 430,
            child: SizedBox(
              width: 316,
              height: 84,
              child: Text(
                'Track your wine histroy',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: mainTextColor,
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
                'Making an account lets you track and access your wine histroy anywhere',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: secondaryTextColor,
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
              width: 70,
              height: 10,
              child: SvgPicture.asset('assets/icons/Dot Indicator_4.svg'),
            ),
          ),
          Positioned(
            left: 40,
            top: 755,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PickLanguageScreen(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Ink(
                    height: 50,
                    width: 315,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  Positioned(
                    left: 151 - 40,
                    top: 768 - 755,
                    child: SizedBox(
                      width: 94,
                      height: 24,
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
