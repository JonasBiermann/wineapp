import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

LineChartData somellierData(
    Color color,
    textColor,
    DocumentSnapshot snapshot1,
    DocumentSnapshot snapshot2,
    DocumentSnapshot snapshot3,
    DocumentSnapshot snapshot4,
    DocumentSnapshot snapshot5,
    DocumentSnapshot snapshot6,
    DocumentSnapshot snapshot7) {
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
          textStyle: TextStyle(
            color: Theme.of(context).indicatorColor,
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
        spots: [
          FlSpot(0, snapshot1['usage'].toDouble()),
          FlSpot(2, snapshot2['usage'].toDouble()),
          FlSpot(4, snapshot3['usage'].toDouble()),
          FlSpot(6, snapshot4['usage'].toDouble()),
          FlSpot(8, snapshot5['usage'].toDouble()),
          FlSpot(10, snapshot6['usage'].toDouble()),
          FlSpot(12, snapshot7['usage'].toDouble())
        ],
        isCurved: true,
        curveSmoothness: 0.5,
        preventCurveOverShooting: true,
        colors: [textColor],
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            color.withOpacity(0.4),
          ],
        ),
      ),
    ],
  );
}
