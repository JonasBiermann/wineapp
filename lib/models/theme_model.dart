import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/data/globals.dart' as globals;

class MultiThemeModel {
  int index;
  String themeName;
  Color color;
  ValueNotifier<bool> selected;

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
      return ValueNotifier(true);
    case 1:
      return ValueNotifier(false);
  }
}

List<MultiThemeModel> themes = List<MultiThemeModel>.generate(
    2,
    (index) => MultiThemeModel(
        index: index,
        themeName: titlesForThemeModel(index),
        color: colorsForThemeModel(index),
        selected: selectedForThemeModel(index)));

List<Widget> widgets = themes
    .map((themeData) =>
        MultipleThemeViewerWidget(themeData: themeData, themes: themes))
    .toList();

class MultipleThemeViewerWidget extends StatefulWidget {
  MultipleThemeViewerWidget(
      {Key? key, required this.themeData, required this.themes})
      : super(key: key);
  MultiThemeModel themeData;
  List<MultiThemeModel> themes;
  @override
  State<MultipleThemeViewerWidget> createState() =>
      _MultipleThemeViewerWidgetState();
}

class _MultipleThemeViewerWidgetState extends State<MultipleThemeViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.themeData.selected,
        builder: (context, bool selected, _) {
          return GestureDetector(
            onTap: () {
              getThemeManager(context)
                  .selectThemeAtIndex(widget.themeData.index);
              if (!selected) {
                widget.themeData.selected.value = true;
                widget.themes
                    .elementAt(widget.themeData.index == 0 ? 1 : 0)
                    .selected
                    .value = false;
              }
              setState(() {
                globals.currentTheme = !globals.currentTheme;
              });
            },
            child: Container(
              height: 60,
              width: 105,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.themeData.color.withOpacity(.3),
                  border: selected
                      ? Border.all(color: widget.themeData.color, width: 3)
                      : Border.all(color: Colors.white)),
              child: Center(
                child: Text(
                  widget.themeData.themeName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: widget.themeData.color,
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
// TODO: implement dispose
    widget.themeData.selected.dispose();
    super.dispose();
  }
}
