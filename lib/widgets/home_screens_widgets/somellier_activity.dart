import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/data/somellier_data.dart';

class SomellierActivity extends StatelessWidget {
  const SomellierActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: 465,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 320,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: Offset(
                    0,
                    6,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 62 - 35,
            top: 480 - 465,
            child: SizedBox(
              height: 30,
              width: 178,
              child: Text(
                'Somellier Activity',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 79 - 35,
            top: 521 - 465,
            child: SizedBox(
              height: 125,
              width: 232.26,
              child: LineChart(
                somellierData(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
