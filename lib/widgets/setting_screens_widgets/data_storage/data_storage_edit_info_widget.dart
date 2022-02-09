import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/data_storage_category_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/settings_edit_button.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class DataStorageEditInfoWidget extends StatelessWidget {
  const DataStorageEditInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 156,
          width: 320,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              25,
            ),
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
          child: SizedBox(
            height: 24,
            width: 125,
            child: Text(
              'Data & Storage',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        DataStorageCategoryWidget(
          categoryName: 'Personal-Data',
          topPadding: 52,
        ),
        DataStorageCategoryWidget(
          categoryName: 'App-Data',
          topPadding: 85,
        ),
        DataStorageCategoryWidget(
          categoryName: 'Cache',
          topPadding: 118,
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
            top: 15,
          ),
          child: SettingsEditButton(),
        ),
      ],
    );
  }
}
