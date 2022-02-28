import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/home/main_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/forgot_password_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/register_screen.dart';
import 'package:wineapp/services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailPhoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              left: 40,
              top: 82,
              child: SizedBox(
                width: 315,
                height: 35,
                child: Text(
                  'Welcome back 👋',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
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
                  'We\'re so happy to see you back. Login to continue where you left off.',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
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
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    cursorColor: Theme.of(context).indicatorColor,
                    cursorRadius: const Radius.circular(90),
                    cursorWidth: 2.5,
                    cursorHeight: 20,
                    controller: emailPhoneController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 334,
              left: 40,
              child: Container(
                height: 50,
                width: 257,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Center(
                    child: TextField(
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Theme.of(context).indicatorColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      cursorColor: Theme.of(context).indicatorColor,
                      cursorRadius: const Radius.circular(90),
                      cursorWidth: 2.5,
                      cursorHeight: 20,
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Theme.of(context).hintColor,
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
              top: 334,
              child: SizedBox(
                height: 50,
                width: 50,
                child: SvgPicture.asset(
                    'assets/icons/general/fingerprint_icon.svg'),
              ),
            ),
            Positioned(
              left: 249,
              top: 394,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    createRoute(
                      const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  width: 110,
                  height: 18,
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
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
                            textStyle: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                  } else {
                    User? result = await AuthService().emailLogin(
                        emailPhoneController.text,
                        passwordController.text,
                        context);
                    if (result != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          createRoute(
                            MainScreen(pageIndex: 0),
                          ),
                          (route) => false);
                    }
                  }
                  setState(() {
                    loading = false;
                  });
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
                      child: loading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).indicatorColor,
                              ),
                            )
                          : Center(
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Theme.of(context).indicatorColor,
                                      fontSize: 14,
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
                        child: Divider(
                          color: Theme.of(context).indicatorColor,
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
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Divider(
                          color: Theme.of(context).indicatorColor,
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        createRoute(
                          MainScreen(pageIndex: 0),
                        ),
                        (route) => false);
                  }
                },
                child: SizedBox(
                  height: 50,
                  width: 55,
                  child:
                      SvgPicture.asset('assets/icons/icons_purple/google.svg'),
                ),
              ),
            ),
            Positioned(
              left: 167,
              top: 640,
              child: SizedBox(
                height: 50,
                width: 55,
                child: SvgPicture.asset('assets/icons/icons_purple/apple.svg'),
              ),
            ),
            Positioned(
              left: 248,
              top: 639,
              child: SizedBox(
                height: 50,
                width: 55,
                child: SvgPicture.asset(
                    'assets/icons/icons_purple/twitter_signup.svg'),
              ),
            ),
            Positioned(
              left: 119,
              top: 756,
              child: SizedBox(
                height: 17,
                width: 153,
                child: Text(
                  'Dont have an account yet?',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              left: 138,
              top: 773,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    createRoute(
                      const RegisterScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 17,
                  width: 115,
                  child: Text(
                    'Create new Account',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).indicatorColor,
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
