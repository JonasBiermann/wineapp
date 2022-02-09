import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_category_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/settings_edit_button.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class DesignEdit extends StatelessWidget {
  const DesignEdit({Key? key}) : super(key: key);

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
                color: backgroundColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 2,
                  color: primaryColor,
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
                  textStyle: const TextStyle(
                    color: mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DesignOverviewCategoryWidget(
              designCategory: 'Design Name',
              topPadding: 52,
            ),
            DesignOverviewCategoryWidget(
              designCategory: 'Primary Color',
              topPadding: 80,
            ),
            DesignOverviewCategoryWidget(
              designCategory: 'Background Color',
              topPadding: 108,
            ),
            DesignOverviewCategoryWidget(
              designCategory: 'Main-Text-Color',
              topPadding: 136,
            ),
            DesignOverviewCategoryWidget(
              designCategory: 'Secondary-Text-Color',
              topPadding: 164,
            ),
            DesignOverviewCategoryWidget(
              designCategory: 'Tertiary-Text-Color',
              topPadding: 192,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 250,
                top: 15,
              ),
              child: SettingsEditButton(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 250,
                top: 49,
              ),
              child: SettingsEditButton(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 250,
                top: 83,
              ),
              child: SettingsEditButton(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 250,
                top: 117,
              ),
              child: SettingsEditButton(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 250,
                top: 151,
              ),
              child: SettingsEditButton(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 250,
                top: 185,
              ),
              child: SettingsEditButton(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 256,
          ),
          child: SubmitSettingChangesButton(),
        ),
      ],
    );
  }
}
