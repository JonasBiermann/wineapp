import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:wineapp/models/theme_model.dart';

Future<dynamic> ThemePickerDialogMethod(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 1,
        backgroundColor: Theme.of(context).indicatorColor,
        insetAnimationCurve: Curves.decelerate,
        child: SizedBox(
          height: 170,
          width: 320,
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 35,
                    right: 35,
                  ),
                  child: LightDarkModePicker()),
              Padding(
                padding: const EdgeInsets.only(
                  top: 85,
                  left: 35,
                  right: 35,
                ),
                child: SizedBox(
                  height: 60,
                  width: 250,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widgets),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class LightDarkModePicker extends StatefulWidget {
  LightDarkModePicker({
    Key? key,
  }) : super(key: key);

  @override
  _LightDarkModePickerState createState() => _LightDarkModePickerState();
}

class _LightDarkModePickerState extends State<LightDarkModePicker> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            width: 250,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (getThemeManager(context).selectedThemeIndex == 2) {
                getThemeManager(context).selectThemeAtIndex(0);
              } else {
                getThemeManager(context).selectThemeAtIndex(1);
              }
              selected = false;
            });

            print(selected);
          },
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 200,
            ),
            width: 138,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                'Light Mode',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 112,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (getThemeManager(context).selectedThemeIndex == 0) {
                  getThemeManager(context).selectThemeAtIndex(2);
                } else {
                  getThemeManager(context).selectThemeAtIndex(3);
                }
                selected = true;
                print(selected);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 200,
              ),
              width: 138,
              height: 30,
              decoration: BoxDecoration(
                color: selected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(90),
              ),
              child: Center(
                child: Text(
                  'Dark Mode',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
