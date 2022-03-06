import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';

class MultiThemeModel {
  int index;
  String themeName;
  Color color;
  bool selected;

  MultiThemeModel(
      {required this.index,
      required this.themeName,
      required this.color,
      required this.selected});
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

colorsForThemeModel(int index) {
  switch (index) {
    case 0:
      return purpleBackgroundColor;
    case 1:
      return redBackgroundColor;
  }
}

selectedForThemeModel(int index) {
  switch (index) {
    case 0:
      return true;
    case 1:
      return false;
  }
}

List<MultiThemeModel> get themes => List<MultiThemeModel>.generate(
    2,
    (index) => MultiThemeModel(
        index: index,
        themeName: titlesForThemeModel(index),
        color: colorsForThemeModel(index),
        selected: selectedForThemeModel(index)));

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
            color: themeData.color.withOpacity(.3),
            border: themeData.selected
                ? Border.all(color: themeData.color, width: 3)
                : Border.all(color: Colors.transparent)),
        child: Center(
          child: Text(
            themeData.themeName,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: themeData.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
