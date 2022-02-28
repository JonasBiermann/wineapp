import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

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
  primaryColor: redDesign[100],
  colorScheme: lightRed.colorScheme.copyWith(
      primary: redDesign[50],
      secondary: redDesign[300],
      tertiary: redDesign[400]),
);
ThemeData lightPurple = ThemeData(
  brightness: Brightness.light,
  primarySwatch: redDesign,
  scaffoldBackgroundColor: purpleDesign[400],
  primaryColor: purpleDesign[100],
  colorScheme: lightPurple.colorScheme.copyWith(
      primary: purpleDesign[50],
      secondary: purpleDesign[300],
      tertiary: purpleDesign[400]),
);

const primaryColor = Color(0xff9A81D5);
const mainTextColor = Color(0xffFFFFFF);
const tertiaryTextColor = Color(0xff6F00CF);
const quartiaryTextColor = Color(0xffC3B3EA);
const backgroundColor = Color(0xff6F00CF);

TextStyle unTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).unselectedWidgetColor,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );
}

TextStyle selTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).selectedRowColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}

void setAsLightPurple(BuildContext context) {
  ThemeManager.of(context).setThemeData(ThemeData(
      brightness: Brightness.light,
      primaryColor: purpleDesign[100],
      scaffoldBackgroundColor: purpleDesign[400],
      unselectedWidgetColor: purpleDesign[300],
      selectedRowColor: purpleDesign[50],
      colorScheme: lightPurple.colorScheme.copyWith(
          primary: purpleDesign[50],
          secondary: purpleDesign[300],
          tertiary: purpleDesign[400])));
}

void setAsLightRed(BuildContext context) {
  ThemeManager.of(context).setThemeData(ThemeData(
      brightness: Brightness.light,
      primaryColor: redDesign[100],
      scaffoldBackgroundColor: redDesign[400],
      unselectedWidgetColor: redDesign[300],
      selectedRowColor: redDesign[50],
      colorScheme: lightRed.colorScheme.copyWith(
          primary: redDesign[50],
          secondary: redDesign[300],
          tertiary: purpleDesign[400])));
}

void setAsDarkPurple(BuildContext context) {
  ThemeManager.of(context).setThemeData(ThemeData(
    brightness: Brightness.dark,
    primaryColor: purpleDesign[100],
    scaffoldBackgroundColor: purpleDesign[400],
    unselectedWidgetColor: purpleDesign[300],
    selectedRowColor: purpleDesign[50],
  ));
}

void setAsDarkRed(BuildContext context) {
  ThemeManager.of(context).setThemeData(ThemeData(
    brightness: Brightness.dark,
    primaryColor: redDesign[100],
    scaffoldBackgroundColor: redDesign[400],
    unselectedWidgetColor: redDesign[300],
    selectedRowColor: redDesign[50],
  ));
}
