import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/models/theme_model.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_category_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/settings_edit_button.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class DesignEdit extends StatefulWidget {
  DesignEdit({Key? key}) : super(key: key);

  @override
  State<DesignEdit> createState() => _DesignEditState();
}

class _DesignEditState extends State<DesignEdit> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 225,
              width: 320,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
              ),
              child: Text(
                'Design',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const DesignOverviewCategoryWidget(
              designCategory: 'Design Name',
              topPadding: 52,
            ),
            const DesignOverviewCategoryWidget(
              designCategory: 'Primary Color',
              topPadding: 80,
            ),
            const DesignOverviewCategoryWidget(
              designCategory: 'Background Color',
              topPadding: 108,
            ),
            const DesignOverviewCategoryWidget(
              designCategory: 'Main-Text-Color',
              topPadding: 136,
            ),
            const DesignOverviewCategoryWidget(
              designCategory: 'Secondary-Text-Color',
              topPadding: 164,
            ),
            const DesignOverviewCategoryWidget(
              designCategory: 'Tertiary-Text-Color',
              topPadding: 192,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 15,
              ),
              child: SettingsEditButton(
                onTap: () {
                  showDialog(
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
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          color: Colors.black,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          selected = false;
                                          print(selected);
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          width: 138,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .indicatorColor,
                                            borderRadius:
                                                BorderRadius.circular(90),
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
                                              color: selected
                                                  ? Colors.black
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(90),
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
                                  ),
                                ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: widgets),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 49,
              ),
              child: SettingsEditButton(
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 83,
              ),
              child: SettingsEditButton(
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 117,
              ),
              child: SettingsEditButton(
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 151,
              ),
              child: SettingsEditButton(
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 185,
              ),
              child: SettingsEditButton(
                onTap: () {},
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 256,
          ),
          child: SubmitSettingChangesButton(),
        ),
      ],
    );
  }
}
