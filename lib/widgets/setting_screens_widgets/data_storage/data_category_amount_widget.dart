import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataCategoryAmountWidget extends StatelessWidget {
  DataCategoryAmountWidget({
    Key? key,
    required this.dataAmount,
    required this.topPadding,
  }) : super(key: key);

  String dataAmount;
  double topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 252,
        top: topPadding,
      ),
      child: SizedBox(
        height: 18,
        width: 53,
        child: Text(
          dataAmount,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Theme.of(context).indicatorColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
