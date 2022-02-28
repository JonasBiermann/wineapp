import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/home/main_screen.dart';

class RegDoneScreen extends StatelessWidget {
  const RegDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              left: 45,
              top: 196,
              child: SizedBox(
                height: 302.51,
                width: 300,
                child:
                    SvgPicture.asset('assets/icons/icons_purple/reg_done.svg'),
              ),
            ),
            Positioned(
              left: 37,
              top: 549,
              child: SizedBox(
                height: 42,
                width: 316,
                child: Text(
                  'Done!',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 597,
              child: SizedBox(
                height: 42,
                width: 334,
                child: Text(
                  'Great, you set up your account. Let\'s continue to your homescreen.',
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
              left: 40,
              top: 755,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MainScreen(
                        pageIndex: 0,
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Ink(
                      height: 50,
                      width: 315,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Positioned(
                      left: 121 - 40,
                      top: 768 - 755,
                      child: SizedBox(
                        height: 24,
                        width: 148,
                        child: Text(
                          'Continue to Home',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
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
      ),
    );
  }
}
