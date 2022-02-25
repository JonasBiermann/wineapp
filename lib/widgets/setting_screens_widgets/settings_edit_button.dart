import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class SettingsEditButton extends StatelessWidget {
  const SettingsEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: 24,
            width: 55,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: quartiaryTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
              top: 5,
            ),
            child: Text(
              'Edit',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: quartiaryTextColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 36,
              top: 8,
            ),
            child: SvgPicture.asset(
              'assets/icons/general/pencil.svg',
              width: 9,
              height: 9,
              color: quartiaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
