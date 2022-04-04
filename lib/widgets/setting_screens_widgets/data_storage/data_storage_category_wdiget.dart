import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataStorageCategoryWidget extends StatelessWidget {
  DataStorageCategoryWidget({
    Key? key,
    required this.categoryName,
    required this.topPadding,
  }) : super(key: key);
  double topPadding;
  String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        top: topPadding,
      ),
      child: SizedBox(
        height: 18,
        width: 100,
        child: Text(
          categoryName,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Theme.of(context).indicatorColor,
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
