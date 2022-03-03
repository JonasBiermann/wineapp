import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
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

Color redBackgroundColor = const Color(0xff810707);
Color purpleBackgroundColor = const Color(0xff6F00CF);

TextStyle unTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).primaryColorLight,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );
}

TextStyle selTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).indicatorColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}

// void setAsLightPurple(BuildContext context) {
//   ThemeManager.of(context).setThemeData(ThemeData(
//       brightness: Brightness.light,
//       primaryColor: purpleDesign[100],
//       scaffoldBackgroundColor: purpleDesign[400],
//       indicatorColor: purpleDesign[50],
//       primaryColorLight: purpleDesign[300],
//       hintColor: purpleDesign[400]));
// }

// void setAsLightRed(BuildContext context) {
//   ThemeManager.of(context).setThemeData(ThemeData(
//       brightness: Brightness.light,
//       primaryColor: redDesign[100],
//       scaffoldBackgroundColor: redDesign[400],
//       indicatorColor: redDesign[50],
//       primaryColorLight: redDesign[300],
//       hintColor: redDesign[400]));
// }

List<ThemeData> getThemes() {
  return [
    ThemeData(
        brightness: Brightness.light,
        primaryColor: purpleDesign[100],
        scaffoldBackgroundColor: purpleDesign[400],
        indicatorColor: purpleDesign[50],
        primaryColorLight: purpleDesign[300],
        hintColor: purpleDesign[400]),
    ThemeData(
        brightness: Brightness.light,
        primaryColor: redDesign[100],
        scaffoldBackgroundColor: redDesign[400],
        indicatorColor: redDesign[50],
        primaryColorLight: redDesign[300],
        hintColor: redDesign[400])
  ];
}
