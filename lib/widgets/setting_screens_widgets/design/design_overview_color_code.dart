import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignOverviewColorCode extends StatelessWidget {
  DesignOverviewColorCode({
    Key? key,
    required this.colorCode,
    required this.topPadding,
  }) : super(key: key);
  String colorCode;
  double topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 260,
        top: topPadding,
      ),
      child: SizedBox(
        height: 18,
        width: 45,
        child: Text(
          colorCode,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: mainTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
