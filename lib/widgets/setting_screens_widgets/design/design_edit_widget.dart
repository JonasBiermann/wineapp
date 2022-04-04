import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_category_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/theme_picker_dialog.dart';
import 'package:wineapp/widgets/setting_screens_widgets/settings_edit_button.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class DesignEdit extends StatefulWidget {
  const DesignEdit({Key? key}) : super(key: key);

  @override
  State<DesignEdit> createState() => _DesignEditState();
}

class _DesignEditState extends State<DesignEdit> {
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
                  ThemePickerDialogMethod(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 49,
              ),
              child: SettingsEditButton(
                onTap: () {
                  ThemePickerDialogMethod(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 83,
              ),
              child: SettingsEditButton(
                onTap: () {
                  ThemePickerDialogMethod(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 117,
              ),
              child: SettingsEditButton(
                onTap: () {
                  ThemePickerDialogMethod(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 151,
              ),
              child: SettingsEditButton(
                onTap: () {
                  ThemePickerDialogMethod(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 250,
                top: 185,
              ),
              child: SettingsEditButton(
                onTap: () {
                  ThemePickerDialogMethod(context);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 256,
          ),
          child: SubmitSettingChangesButton(
            cancelOnTap: () {},
            continueOnTap: () {},
            buttonText: 'Submit',
            cancelText: 'Delete Changes',
          ),
        ),
      ],
    );
  }
}
