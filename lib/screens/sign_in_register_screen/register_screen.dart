import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/sign_in_register_screen/login_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/registration_verification_screen.dart';
import 'package:wineapp/services/auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailPhoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  bool loading = false;
  bool agreed = false;
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
                height: 35,
                width: 315,
                child: Text(
                  'Create a new Account',
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
              top: 120,
              child: SizedBox(
                height: 42,
                width: 315,
                child: Text(
                  'Create an Account so you can make use of your personal Somellier',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: secondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 219,
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
                      cursorColor: mainTextColor,
                      cursorRadius: const Radius.circular(90),
                      cursorWidth: 2.5,
                      cursorHeight: 20,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: mainTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
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
              top: 294,
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
                      cursorColor: mainTextColor,
                      cursorRadius: const Radius.circular(90),
                      cursorWidth: 2.5,
                      cursorHeight: 20,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: mainTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      controller: emailPhoneController,
                      decoration: InputDecoration(
                        hintText: 'Phone/Email',
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
              top: 369,
              left: 40,
              child: Container(
                height: 50,
                width: 257,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Center(
                    child: TextField(
                      obscureText: true,
                      cursorColor: mainTextColor,
                      cursorRadius: const Radius.circular(90),
                      cursorWidth: 2.5,
                      cursorHeight: 20,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: mainTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: tertiaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 307,
              top: 369,
              child: SizedBox(
                height: 50,
                width: 50,
                child: SvgPicture.asset('assets/icons/fingerprint_icon.svg'),
              ),
            ),
            Positioned(
              left: 40,
              top: 439,
              child: GestureDetector(
                onTap: () {
                  if (agreed == false) {
                    setState(() {
                      agreed = true;
                    });
                  } else {
                    setState(() {
                      agreed = false;
                    });
                  }
                },
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: agreed
                      ? SvgPicture.asset(
                          'assets/icons/accept_icon.svg',
                        )
                      : SvgPicture.asset(
                          'assets/icons/accept_icon.svg',
                          color: mainTextColor,
                        ),
                ),
              ),
            ),
            Positioned(
              left: 70,
              top: 438,
              child: SizedBox(
                height: 17,
                width: 280,
                child: RichText(
                  text: TextSpan(
                    text: 'I agree to the ',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: secondaryTextColor,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: mainTextColor),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'and ',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: secondaryTextColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Privacy Policy',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: mainTextColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 518,
              left: 40,
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  if (emailPhoneController.text == '' ||
                      passwordController.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'All fields are required!',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: mainTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        backgroundColor: primaryColor,
                      ),
                    );
                  } else {
                    User? result = await AuthService().emailRegister(
                        emailPhoneController.text,
                        passwordController.text,
                        context);
                    if (result != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          createRoute(
                            const RegVerificationScreen(),
                          ),
                          (route) => false);
                    }
                  }
                  setState(() {
                    loading = false;
                  });
                },
                child: Container(
                  height: 50,
                  width: 315,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: loading
                      ? const Center(
                          child:
                              CircularProgressIndicator(color: mainTextColor),
                        )
                      : Center(
                          child: SizedBox(
                            height: 24,
                            width: 140,
                            child: Text(
                              'Create Account',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: mainTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 592,
              child: SizedBox(
                height: 15,
                width: 309,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: const Divider(
                          color: mainTextColor,
                          height: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                      width: 25,
                      child: Center(
                        child: Text(
                          'OR',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: secondaryTextColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: const Divider(
                          color: mainTextColor,
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 82,
              top: 639,
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  User? result = await AuthService().signInWithGoogle();
                  if (result != null) {
                    Navigator.push(
                      context,
                      createRoute(
                        const RegVerificationScreen(),
                      ),
                    );
                  }

                  setState(() {
                    loading = false;
                  });
                },
                child: SizedBox(
                  height: 50,
                  width: 55,
                  child: loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : SvgPicture.asset('assets/icons/google.svg'),
                ),
              ),
            ),
            Positioned(
              left: 167,
              top: 640,
              child: SizedBox(
                height: 50,
                width: 55,
                child: SvgPicture.asset('assets/icons/apple.svg'),
              ),
            ),
            Positioned(
              left: 248,
              top: 639,
              child: GestureDetector(
                onTap: () async {
                  AuthService().twitterLogin();
                },
                child: SizedBox(
                  height: 50,
                  width: 55,
                  child: SvgPicture.asset('assets/icons/twitter_signup.svg'),
                ),
              ),
            ),
            Positioned(
              left: 122,
              top: 756,
              child: SizedBox(
                height: 17,
                width: 148,
                child: Text(
                  'Already have an Account?',
                  style: GoogleFonts.poppins(
                      color: secondaryTextColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              left: 179,
              top: 773,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    createRoute(
                      const LoginScreen(),
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
