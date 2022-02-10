import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/screens/sign_in_register_screen/login_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/register_screen.dart';
import 'package:wineapp/widgets/age_verification_textfields.dart';

class AgeVerificationScreen extends StatelessWidget {
  AgeVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 45,
            top: 161,
            child: SizedBox(
              height: 241.29,
              width: 300,
              child: SvgPicture.asset('assets/icons/birthday.svg'),
            ),
          ),
          Positioned(
            left: 37,
            top: 430,
            child: SizedBox(
              height: 84,
              width: 316,
              child: Text(
                'Type in your age below',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: mainTextColor,
                    fontSize: 28,
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
                'Deepnding on your region, you will have to fulfill the minimum age to consume alcohol',
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
            left: 35,
            top: 604,
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1,
                      color: primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: CodeField(
                    generateAmount: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 88,
                  ),
                  child: CodeField(
                    generateAmount: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 175,
                  ),
                  child: CodeField(
                    generateAmount: 4,
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
                Navigator.of(context).push(
                  createRoute(
                    LoginScreen(),
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
                    RegisterScreen(),
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
