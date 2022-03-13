import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/search_screens_widgets/pref_information_card.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WineDetailScreen extends StatelessWidget {
  WineDetailScreen({Key? key, required this.wineDocument}) : super(key: key);
  DocumentSnapshot wineDocument;
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
        tag: wineDocument['wineID'],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeScreenHeader(
                subText: 'Wine',
                mainText: wineDocument['wineType'],
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
                      image: NetworkImage(wineDocument['wineURL']),
                      fit: BoxFit.cover,
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
                  wineDocument['wineName'],
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
                    wineDocument['wineDescription'],
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
                  'Use',
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
                  right: 35,
                  top: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CuisineCard(
                      wineCuisine: wineDocument['wineUse'][0],
                      height: 41,
                      width: 98,
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                    CuisineCard(
                      wineCuisine: wineDocument['wineUse'][1],
                      height: 41,
                      width: 98,
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                    CuisineCard(
                      wineCuisine: wineDocument['wineUse'][2],
                      height: 41,
                      width: 98,
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SettingBottomNavigationBar(
        detailSetting: true,
        data: data,
        dataLabel: dataLabel,
      ),
    );
  }
}
