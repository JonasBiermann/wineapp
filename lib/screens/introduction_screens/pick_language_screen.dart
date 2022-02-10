import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/screens/introduction_screens/age_verification_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/login_screen.dart';

class PickLanguageScreen extends StatelessWidget {
  const PickLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 45,
            top: 191,
            child: SizedBox(
              height: 215,
              width: 300,
              child: SvgPicture.asset('assets/icons/globe_languages.svg'),
            ),
          ),
          Positioned(
            left: 37,
            top: 430,
            child: SizedBox(
              height: 84,
              width: 316,
              child: Text(
                'Pick your preferred language',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    color: mainTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 28,
            top: 529,
            child: SizedBox(
              height: 42,
              width: 334,
              child: Text(
                'Pick your native/preferred language to use the App',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 38,
            top: 604,
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: 315,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 14,
                  ),
                  child: SizedBox(
                    height: 21,
                    width: 40,
                    child: Image.asset('assets/images/usa.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                    top: 14,
                  ),
                  child: Text(
                    'US - English',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 279,
                    top: 14,
                  ),
                  child: SizedBox(
                    height: 21,
                    width: 21,
                    child: SvgPicture.asset(
                      'assets/icons/arrow-down-2.svg',
                      color: mainTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 166,
            top: 690,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: SizedBox(
                height: 14,
                width: 58,
                child: Text(
                  'Skip to Login',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: mainTextColor,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 38,
            top: 755,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  createRoute(
                    AgeVerificationScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 315,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 16,
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
