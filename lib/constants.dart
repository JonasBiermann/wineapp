import 'package:flutter/material.dart';

const MaterialColor purpleDesign = MaterialColor(0xff6F00CF, <int, Color>{
  50: Color(0xffFFFFFF),
  100: Color(0xff9A81D5),
  200: Color(0xff6F00CF),
  300: Color(0xffC3B3EA),
  400: Color(0xff6F00CF),
});

const MaterialColor redDesign = MaterialColor(0xff810707, <int, Color>{
  50: Color(0xffFFFFFF),
  100: Color(0xffA33D3B),
  200: Color(0xff810707),
  300: Color(0xffF08884),
  400: Color(0xff810707),
});

ThemeData lightRed = ThemeData(
  brightness: Brightness.light,
  primarySwatch: redDesign,
  scaffoldBackgroundColor: redDesign[400],
  textTheme: TextTheme(
    headline1: TextStyle(
      color: redDesign[50],
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline2: TextStyle(
      color: redDesign[300],
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      color: redDesign[50],
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline4: TextStyle(
      color: redDesign[300],
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleLarge: TextStyle(
      color: redDesign[50],
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    titleMedium: TextStyle(
      color: redDesign[50],
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: redDesign[50],
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      color: redDesign[300],
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    button: TextStyle(
      color: redDesign[50],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      color: redDesign[50],
      fontSize: 9,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
        color: redDesign[300], fontWeight: FontWeight.bold, fontSize: 10),
    labelLarge: TextStyle(
      color: redDesign[400],
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      color: redDesign[50],
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      color: redDesign[50],
      fontSize: 5,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      color: redDesign[50],
      fontSize: 7,
      fontWeight: FontWeight.w600,
    ),
  ),
);
ThemeData lightPurple = ThemeData(
  brightness: Brightness.light,
  primarySwatch: redDesign,
  scaffoldBackgroundColor: purpleDesign[400],
  textTheme: TextTheme(
    headline1: TextStyle(
      color: purpleDesign[50],
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline2: TextStyle(
      color: purpleDesign[300],
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      color: purpleDesign[50],
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline4: TextStyle(
      color: purpleDesign[300],
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleLarge: TextStyle(
      color: purpleDesign[50],
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    titleMedium: TextStyle(
      color: purpleDesign[50],
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: purpleDesign[50],
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      color: purpleDesign[300],
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    button: TextStyle(
      color: purpleDesign[50],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      color: purpleDesign[50],
      fontSize: 9,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
        color: purpleDesign[300], fontWeight: FontWeight.bold, fontSize: 10),
    labelLarge: TextStyle(
      color: purpleDesign[400],
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      color: purpleDesign[50],
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      color: purpleDesign[50],
      fontSize: 5,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      color: purpleDesign[50],
      fontSize: 7,
      fontWeight: FontWeight.w600,
    ),
  ),
);

const primaryColor = Color(0xff9A81D5);
const mainTextColor = Color(0xffFFFFFF);
const tertiaryTextColor = Color(0xff6F00CF);
const quartiaryTextColor = Color(0xffC3B3EA);
const backgroundColor = Color(0xff6F00CF);

TextStyle unTextStyle = const TextStyle(
  color: quartiaryTextColor,
  fontSize: 11,
  fontWeight: FontWeight.w600,
);
TextStyle selTextStyle = const TextStyle(
  color: mainTextColor,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);
