import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/screens/introduction_screens/age_verification_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/login_screen.dart';
import 'package:wineapp/data/globals.dart' as globals;

class PickLanguageScreen extends StatelessWidget {
  const PickLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 45,
            top: 191,
            child: SizedBox(
              height: 215,
              width: 300,
              child: globals.currentTheme
                  ? SvgPicture.asset(
                      'assets/icons/icons_purple/globe_languages_purple.svg')
                  : SvgPicture.asset(
                      'assets/icons/icons_red/globe_languages_red.svg'),
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
                  textStyle: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).indicatorColor,
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
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColorLight,
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
            child: GestureDetector(
              onTap: () {
                LanguagePickerDialog(context);
              },
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 315,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 14,
                    ),
                    child: Text(
                      'US - English',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Theme.of(context).indicatorColor,
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
                        'assets/icons/general/arrow-down-2.svg',
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  ),
                ],
              ),
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
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: SizedBox(
                height: 14,
                width: 58,
                child: Text(
                  'Skip to Login',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
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
                    const AgeVerificationScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 315,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
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

LanguagePickerDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(vertical: 213, horizontal: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 1,
          backgroundColor: Theme.of(context).primaryColorLight,
          insetAnimationCurve: Curves.decelerate,
          child: Stack(
            children: [
              const SizedBox(
                height: 304,
                width: 320,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 15,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.translate_rounded,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 5,
                      ),
                      child: Text(
                        'Change Language',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Here you can choose whatever language fits you best. If you can\'t find your language you can alawys contribute by helpgin to translate parts of the app!',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        height: 25,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'English',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Deutsch',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Français',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Continue',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
