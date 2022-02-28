import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

import 'package:wineapp/widgets/setting_screens_widgets/settings_edit_button.dart';

class NotificationEditCard extends StatelessWidget {
  const NotificationEditCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 292,
          width: 320,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
              25,
            ),
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
            'Notifications',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 52,
          ),
          child: SizedBox(
            height: 18,
            width: 64,
            child: Text(
              'Email',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 85,
          ),
          child: SizedBox(
            height: 18,
            width: 34,
            child: Text(
              'Phone',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 118,
          ),
          child: SizedBox(
            height: 18,
            width: 39,
            child: Text(
              'Somellier',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 151,
          ),
          child: SizedBox(
            height: 18,
            width: 25,
            child: Text(
              'Meal Suggestions',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 184,
          ),
          child: SizedBox(
            height: 18,
            width: 50,
            child: Text(
              'Invitations',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 222,
          ),
          child: SizedBox(
            height: 18,
            width: 45,
            child: Text(
              'Deals & Offers',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: mainTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 258,
          ),
          child: SizedBox(
            height: 18,
            width: 45,
            child: Text(
              'App News',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 250,
            top: 15,
          ),
          child: SettingsEditButton(
            onTap: () {},
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
        Padding(
          padding: const EdgeInsets.only(
            left: 250,
            top: 219,
          ),
          child: SettingsEditButton(
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 250,
            top: 253,
          ),
          child: SettingsEditButton(
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
