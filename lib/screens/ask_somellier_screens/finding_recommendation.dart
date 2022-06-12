import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/screens/ask_somellier_screens/somellier_result_screen.dart';

class FindingRecommendationScreen extends StatefulWidget {
  const FindingRecommendationScreen({
    Key? key,
    required this.snapshotName,
  }) : super(key: key);
  final QueryDocumentSnapshot<Map<String, dynamic>>? snapshotName;
  @override
  State<FindingRecommendationScreen> createState() =>
      _FindingRecommendationScreenState();
}

class _FindingRecommendationScreenState
    extends State<FindingRecommendationScreen> {
  bool progressDone = true;
  late Future<IconData> iconSnapshot;
  Future<bool> animationDone() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        progressDone = true;
      });
    });
    return progressDone;
  }

  Future<IconData> iconData(Future<bool> progress) async {
    if (await progress == true) {
      return Icons.home;
    }
    print('function used');
    return Icons.done;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 100,
            ),
            child: Text(
              'Your Somellier is searching...',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width - 200) / 2,
              right: (MediaQuery.of(context).size.width - 200) / 2,
              top: 50,
            ),
            child: CircularPercentIndicator(
              radius: 120,
              lineWidth: 4.0,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: 3000,
              percent: 1,
              // center: FutureBuilder<IconData>(
              //   future: iconData(animationDone()),
              //   builder: (context, snapshot) {
              //     return Icon(
              //       snapshot.data,
              //       color: Colors.white,
              //     );
              //   },
              // ),
              // center: const Icon(
              //   Icons.done_rounded,
              //   color: Colors.white,
              //   size: 90,
              // ),
              center: Text(
                'Finding Wine 🍷',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              progressColor: Theme.of(context).indicatorColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              top: 200,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    createRoute(const SomellierResultScreen()),
                    (route) => false);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    widget.snapshotName?['name'],
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
