import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignOverviewColorContainer extends StatelessWidget {
  DesignOverviewColorContainer({
    Key? key,
    required this.color,
    required this.topPadding,
  }) : super(key: key);
  Color color;
  double topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 233,
        top: topPadding,
      ),
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
            color: mainTextColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
