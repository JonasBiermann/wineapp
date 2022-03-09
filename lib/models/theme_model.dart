import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/data/globals.dart' as globals;

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
    .map((themeData) =>
        MultipleThemeViewerWidget(themeData: themeData, themes: themes))
    .toList();

class MultipleThemeViewerWidget extends StatefulWidget {
  MultipleThemeViewerWidget(
      {Key? key, required this.themeData, required this.themes})
      : super(key: key);
  final MultiThemeModel themeData;
  final List themes;

  @override
  State<MultipleThemeViewerWidget> createState() =>
      _MultipleThemeViewerWidgetState();
}

class _MultipleThemeViewerWidgetState extends State<MultipleThemeViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (getThemeManager(context).selectedThemeIndex! >= 2) {
          getThemeManager(context)
              .selectThemeAtIndex(widget.themeData.index + 2);
        } else {
          getThemeManager(context).selectThemeAtIndex(widget.themeData.index);
        }
        setState(() {
          if (getThemeManager(context).selectedThemeIndex == 0) {
            globals.currentTheme = true;
          }
          if (getThemeManager(context).selectedThemeIndex == 1) {
            globals.currentTheme = false;
          }
        });
      },
      child: Container(
        height: 60,
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.themeData.color.withOpacity(.3),
        ),
        child: Center(
          child: Text(
            widget.themeData.themeName,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.themeData.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
