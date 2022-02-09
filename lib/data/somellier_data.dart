import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

LineChartData somellierData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      leftTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 20,
        interval: 1,
        getTextStyles: (context, value) => GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: mainTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'Mon';
            case 2:
              return 'Tue';
            case 4:
              return 'Wed';
            case 6:
              return 'Thu';
            case 8:
              return 'Fri';
            case 10:
              return 'Sat';
            case 12:
              return 'Sun';
          }
          return '';
        },
        margin: 5,
      ),
    ),
    borderData: FlBorderData(show: false),
    minX: 0,
    maxX: 12,
    minY: 0,
    maxY: 3,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 0),
          FlSpot(2, 1),
          FlSpot(4, 0),
          FlSpot(6, 1),
          FlSpot(8, 1),
          FlSpot(10, 3),
          FlSpot(12, 0)
        ],
        isCurved: true,
        curveSmoothness: 0.5,
        preventCurveOverShooting: true,
        colors: [mainTextColor],
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            backgroundColor.withOpacity(0.4),
          ],
        ),
      ),
    ],
  );
}
