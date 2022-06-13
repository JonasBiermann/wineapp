import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/screens/sign_in_register_screen/login_screen.dart';
import 'package:wineapp/screens/sign_in_register_screen/register_screen.dart';
import 'package:wineapp/data/globals.dart' as globals;
import 'package:wineapp/services/shared_preferences_methods.dart';

class AgeVerificationScreen extends StatefulWidget {
  const AgeVerificationScreen({Key? key, required this.languagePreference})
      : super(key: key);
  final String? languagePreference;

  @override
  State<AgeVerificationScreen> createState() => _AgeVerificationScreenState();
}

class _AgeVerificationScreenState extends State<AgeVerificationScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 45,
            top: 161,
            child: SizedBox(
              height: 241.29,
              width: 300,
              child: globals.currentTheme
                  ? SvgPicture.asset(
                      'assets/icons/icons_purple/birthday_purple.svg')
                  : SvgPicture.asset('assets/icons/icons_red/birthday_red.svg'),
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
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
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
                'Depending on your region, you will have to fulfill the minimum age to consume alcohol',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 137,
            top: 600,
            child: SizedBox(
              height: 57,
              width: 116,
              child: Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 57,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: controller1,
                          cursorColor: Colors.white,
                          cursorRadius: const Radius.circular(90),
                          cursorWidth: 2,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '1',
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 57,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: controller2,
                          cursorColor: Colors.white,
                          cursorRadius: const Radius.circular(90),
                          cursorWidth: 2,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '8',
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 166,
            top: 690,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  createRoute(
                    const LoginScreen(),
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
                setState(() {
                  age = int.parse(controller1.text + controller2.text);
                  SharedPreferencesOperations().setAge(age);
                });
                Navigator.of(context).push(
                  createRoute(
                    const RegisterScreen(),
                  ),
                );
                print(age);
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
