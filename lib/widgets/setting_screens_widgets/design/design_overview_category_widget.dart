import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignOverviewCategoryWidget extends StatelessWidget {
  const DesignOverviewCategoryWidget({
    Key? key,
    required this.designCategory,
    required this.topPadding,
  }) : super(key: key);
  final String designCategory;
  final double topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        top: topPadding,
      ),
      child: SizedBox(
        height: 18,
        width: 140,
        child: Text(
          designCategory,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: mainTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
