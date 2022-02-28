import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/sign_in_register_screen/reset_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 45,
            top: 195,
            child: SizedBox(
              width: 300,
              height: 199.37,
              child: SvgPicture.asset(
                  'assets/icons/icons_purple/forgot_password.svg'),
            ),
          ),
          Positioned(
            left: 37,
            top: 451,
            child: SizedBox(
              width: 316,
              height: 42,
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 28,
            top: 499,
            child: SizedBox(
              width: 334,
              height: 42,
              child: Text(
                  'Don\'t worry! It happens. Please enter the address assosciated with your account',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
            ),
          ),
          Positioned(
            left: 38,
            top: 604,
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
                      hintText: 'Phone/Email',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 16,
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
            top: 755,
            left: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordScreen(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 315,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  Positioned(
                    top: 768 - 755,
                    left: 157 - 40,
                    child: SizedBox(
                      height: 24,
                      width: 140,
                      child: Text(
                        'Continue',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
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
