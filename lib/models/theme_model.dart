import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter/material.dart';

class MultiThemeModel {
  int index;
  String themeName;

  MultiThemeModel({required this.index, required this.themeName});
}

titlesForThemeModel(int index) {
  switch (index) {
    case 0:
      return 'Luxury Purple';
    case 1:
      return 'Red Wine';
  }
  return 'No theme for index';
}

List<MultiThemeModel> get themes => List<MultiThemeModel>.generate(
    2,
    (index) =>
        MultiThemeModel(index: index, themeName: titlesForThemeModel(index)));

List<Widget> get widgets => themes
    .map((themeData) => MultipleThemeViewerWidget(themeData: themeData))
    .toList();

class MultipleThemeViewerWidget extends StatelessWidget {
  MultipleThemeViewerWidget({Key? key, required this.themeData})
      : super(key: key);
  final MultiThemeModel themeData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getThemeManager(context).selectThemeAtIndex(themeData.index);
      },
      child: Container(
        height: 60,
        width: 105,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
            border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor, width: 3)),
        child: Center(
          child: Text(
            themeData.themeName,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
