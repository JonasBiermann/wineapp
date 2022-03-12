import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class HomeScreenHeader extends StatelessWidget {
  String subText;
  String mainText;
  double boxWidth;

  HomeScreenHeader({
    Key? key,
    required this.subText,
    required this.mainText,
    required this.boxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 35,
        top: 43,
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 55,
            width: boxWidth,
            child: Text(
              subText,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            left: 0,
            top: 64 - 43,
            child: SizedBox(
              height: 34,
              width: boxWidth,
              child: Text(
                mainText,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
