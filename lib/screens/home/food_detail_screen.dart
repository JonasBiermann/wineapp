import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';

import '../../models/custom_icons_icons.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({Key? key, required this.mealDocument})
      : super(key: key);
  final DocumentSnapshot mealDocument;
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: Hero(
        tag: mealDocument['iD'],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeScreenHeader(
                subText: 'Food',
                mainText: mealDocument['type'],
                boxWidth: 161,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 28,
                ),
                child: Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(mealDocument['url']),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 10,
                ),
                child: Text(
                  'Name',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  mealDocument['name'],
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 5,
                ),
                child: Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                ),
                child: SizedBox(
                  width: 320,
                  child: Text(
                    mealDocument['description'],
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 5,
                ),
                child: Text(
                  'Cuisine',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 18,
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
                child: Container(
                  height: 38,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      mealDocument['type'],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 102,
                  left: 168,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 17,
                    width: 54,
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
        ),
      ),
      // bottomNavigationBar: SettingBottomNavigationBar(
      //   detailSetting: true,
      //   data: data,
      //   dataLabel: dataLabel,
      // ),
    );
  }
}
