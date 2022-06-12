import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/data/globals.dart' as globals;

class SomellierChart extends StatefulWidget {
  SomellierChart(
      {Key? key,
      required this.color,
      required this.textColor,
      required this.queryDocumentSnapshot})
      : super(key: key);
  Color textColor;
  Color color;
  List<QueryDocumentSnapshot> queryDocumentSnapshot;
  @override
  _SomellierChartState createState() => _SomellierChartState();
}

class _SomellierChartState extends State<SomellierChart> {
  late Future<List<double>> futureDouble;

  Future<double> spotData(String day, queryDocumentSnapshot) async {
    final documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('activity')
        .doc('${globals.year}')
        .collection('week${globals.week}')
        .doc(day.toString())
        .get();

    if (documentSnapshot.exists) {
      print('Document exists');
      return documentSnapshot['usage'].toDouble();
    } else {
      print('Document doesnt exist');
      return 0;
    }
  }

  Future<List<double>> values() async {
    var list = <double>[];
    list.add(await spotData('1', widget.queryDocumentSnapshot));
    list.add(await spotData('2', widget.queryDocumentSnapshot));
    list.add(await spotData('3', widget.queryDocumentSnapshot));
    list.add(await spotData('4', widget.queryDocumentSnapshot));
    list.add(await spotData('5', widget.queryDocumentSnapshot));
    list.add(await spotData('6', widget.queryDocumentSnapshot));
    list.add(await spotData('7', widget.queryDocumentSnapshot));
    return list;
  }

  @override
  void initState() {
    super.initState();
    futureDouble = values();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<double>>(
        future: futureDouble,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _lineChart(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Text(
            'Loading...',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          );
        });
  }

  Widget _lineChart(List<double> value) {
    return LineChart(
      LineChartData(
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
              FlSpot(0, value[0]),
              FlSpot(2, value[1]),
              FlSpot(4, value[2]),
              FlSpot(6, value[3]),
              FlSpot(8, value[4]),
              FlSpot(10, value[5]),
              FlSpot(12, value[6]),
            ],
            isCurved: true,
            curveSmoothness: 0.35,
            preventCurveOverShooting: true,
            colors: [widget.textColor],
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors: [
                widget.color.withOpacity(0.4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
