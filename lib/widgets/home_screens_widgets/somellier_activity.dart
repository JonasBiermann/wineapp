import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/data/somellier_data.dart';
import 'package:wineapp/data/globals.dart' as globals;

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
                    color: Theme.of(context).indicatorColor,
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('activity')
                      .doc('2022')
                      .collection('week${globals.week}')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return LineChart(
                      somellierData(
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).indicatorColor,
                        snapshot.data!.docs[0],
                        snapshot.data!.docs[1],
                        snapshot.data!.docs[2],
                        snapshot.data!.docs[3],
                        snapshot.data!.docs[4],
                        snapshot.data!.docs[5],
                        snapshot.data!.docs[6],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
