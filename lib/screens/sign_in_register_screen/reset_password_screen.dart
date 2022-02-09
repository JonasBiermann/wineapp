import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/sign_in_register_screen/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Positioned(
              left: 40,
              top: 82,
              child: SizedBox(
                width: 315,
                height: 35,
                child: Text(
                  'Reset Password',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 121,
              child: SizedBox(
                width: 315,
                height: 42,
                child: Text(
                  'No worries, you can easily reset your password. WE got you covered.',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: secondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 259,
              child: Container(
                height: 50,
                width: 315,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Reset Password',
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: tertiaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 334,
              child: Container(
                height: 50,
                width: 315,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Confirm new Passowrd',
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: tertiaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 510,
              left: 40,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 315,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Positioned(
                      top: 523 - 510,
                      left: 165 - 40,
                      child: SizedBox(
                        height: 24,
                        width: 140,
                        child: Text(
                          'Submit',
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
            Positioned(
              left: 111,
              top: 756,
              child: SizedBox(
                height: 17,
                width: 168,
                child: Text(
                  'Remembered your Password?',
                  style: GoogleFonts.poppins(
                      color: secondaryTextColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              left: 180,
              top: 773,
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
                  height: 17,
                  width: 31,
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      color: mainTextColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
