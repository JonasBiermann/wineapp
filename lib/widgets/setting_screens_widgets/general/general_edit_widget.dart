import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';
import 'package:wineapp/widgets/setting_screens_widgets/general/user_info_edit_widget.dart';

class GeneralEdit extends StatelessWidget {
  const GeneralEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/a+j1.jpeg',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(
              90,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: SizedBox(
            height: 18,
            width: 136,
            child: Text(
              'Change Profile Picture',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: UserInfoEditWidget(),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 99,
          ),
          child: SubmitSettingChangesButton(),
        ),
      ],
    );
  }
}
