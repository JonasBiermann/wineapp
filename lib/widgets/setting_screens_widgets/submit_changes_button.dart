import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class SubmitSettingChangesButton extends StatelessWidget {
  const SubmitSettingChangesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 153,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: quartiaryTextColor,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Delete Changes',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: quartiaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 153,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: mainTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
