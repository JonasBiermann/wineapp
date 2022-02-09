import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/introduction_screens/introduction_screen_4.dart';
import 'package:wineapp/screens/introduction_screens/introduction_screen_2.dart';

class IntroductionScreen1 extends StatelessWidget {
  const IntroductionScreen1({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 45,
            top: 184,
            child: SizedBox(
              height: 218.29,
              width: 300,
              child: SvgPicture.asset('assets/icons/wine_tasting.svg'),
            ),
          ),
          Positioned(
            left: 58,
            top: 430,
            child: SizedBox(
              width: 274,
              height: 84,
              child: Text(
                'The perfect wine for every meal',
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
                'Create an account to get started on your journeye.',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: secondaryTextColor,
                  ),
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
              child: SvgPicture.asset('assets/icons/dot_indicator_1.svg'),
            ),
          ),
          Positioned(
            left: 98,
            top: 771,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IntroductionScreen4(),
                  ),
                );
              },
              child: Ink(
                child: Text(
                  'Skip',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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
                  createRoute(),
                );
              },
              child: Stack(
                children: [
                  Ink(
                    height: 50,
                    width: 153,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    left: 248 - 202,
                    top: 768 - 755,
                    child: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: mainTextColor,
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
                        'assets/icons/arrow_right.svg',
                        color: mainTextColor,
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

Route createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(
      milliseconds: 200,
    ),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const IntroductionScreen2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInToLinear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
