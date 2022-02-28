import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/data/chart_data.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/data_storage_info_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataStorageOverview extends StatelessWidget {
  DataStorageOverview(
      {Key? key,
      required this.dataAmount,
      required this.pDataAmount,
      required this.aDataAmount,
      required this.cDataAmount,
      required this.accountAge,
      required this.somellierAccuracy})
      : super(key: key);
  int dataAmount;
  int pDataAmount;
  int aDataAmount;
  int cDataAmount;
  int accountAge;
  double somellierAccuracy;
  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [
      ChartData(
          x: 'Accurate',
          y: somellierAccuracy,
          color: Theme.of(context).primaryColor),
      ChartData(
          x: 'not Accurate',
          y: 20,
          color: Theme.of(context).colorScheme.secondary),
    ];
    return Column(
      children: [
        DataStorageInfoCard(
            pDataAmount: pDataAmount,
            dataAmount: dataAmount,
            aDataAmount: aDataAmount,
            cDataAmount: cDataAmount,
            accountAge: accountAge),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: SizedBox(
                  height: 24,
                  width: 173,
                  child: Text(
                    'Somellier Accuracy',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                  top: 55,
                ),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      DoughnutSeries<ChartData, String>(
                        dataSource: chartData,
                        pointColorMapper: (ChartData data, _) => data.color,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        // Radius of doughnut's inner circle
                        innerRadius: '80%',
                        radius: '120%',
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 142,
                  top: 103,
                ),
                child: SizedBox(
                  height: 24,
                  width: 35,
                  child: Text(
                    '${somellierAccuracy}%',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 17,
              width: 47,
              child: Center(
                child: Text(
                  'Go Back',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
