import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/screens/ask_somellier_screens/finding_recommendation.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/search_screens_widgets/pref_information_card.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class AskSomellierStep4Screen extends StatelessWidget {
  AskSomellierStep4Screen(
      {Key? key,
      required this.stepDescription,
      required this.wineOrMeal,
      required this.mealVSWine})
      : super(key: key);

  final String wineOrMeal;
  final String stepDescription;
  final bool mealVSWine;
  List<String> dataLabel = [
    'Home',
    'Search',
    'Account',
  ];
  List<IconData> data = [
    CustomIcons.home,
    CustomIcons.search,
    CustomIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeScreenHeader(
            subText: 'Wine and Food',
            mainText: 'Ask your Somellier',
            boxWidth: 238,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 172,
              top: 92,
            ),
            child: Text(
              'Step 4',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 97,
            ),
            child: Text(
              stepDescription,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              top: 25,
            ),
            child: Stack(
              children: [
                Container(
                  height: 35,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 14.5,
                  child: SizedBox(
                    height: 21,
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 320 - 35,
                  top: 119 - 110,
                  child: SizedBox(
                    height: 17,
                    width: 17,
                    child: SvgPicture.asset(
                      'assets/icons/general/search.svg',
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              top: 15,
            ),
            child: Text(
              'Popular Choices',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              top: 5,
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection(wineOrMeal).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return SizedBox(
                  height: 330,
                  width: 320,
                  child: Center(
                    child: ListView.builder(
                      dragStartBehavior: DragStartBehavior.down,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) => mealVSWine
                          ? PrefInformationCardWine(
                              snapShotDocument: snapshot.data!.docs[index],
                              cardColor: Theme.of(context).primaryColor,
                              selected: false,
                            )
                          : PrefInformationCardMeal(
                              snapshotDocument: snapshot.data!.docs[index],
                              cardColor: Theme.of(context).primaryColor,
                              selected: false,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              top: 25,
            ),
            child: SubmitSettingChangesButton(
              buttonText: 'Continue',
              cancelText: 'Cancel',
              cancelOnTap: () {
                Navigator.pop(context);
              },
              continueOnTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    createRoute(const FindingRecommendationScreen()),
                    (route) => false);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 156,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 16,
                width: 47,
                child: Center(
                  child: Text(
                    'Go Back',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
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
      ),
      // bottomNavigationBar: SettingBottomNavigationBar(
      //   data: data,
      //   dataLabel: dataLabel,
      //   detailSetting: true,
      // ),
    );
  }
}
