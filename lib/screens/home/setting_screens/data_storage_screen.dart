import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/data_storage_edit.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/data_storage_overview.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_bottom_navigation_bar.dart';

class DataStorageSettingsScreen extends StatefulWidget {
  DataStorageSettingsScreen({Key? key, required this.settingName})
      : super(key: key);
  String settingName;
  @override
  _DataStorageSettingsScreenState createState() =>
      _DataStorageSettingsScreenState();
}

class _DataStorageSettingsScreenState extends State<DataStorageSettingsScreen> {
  int changeIndex = 0;
  List<IconData> data = [
    CustomIcons.home,
    CustomIcons.search,
    CustomIcons.user,
  ];
  List<String> changeLabel = [
    'Overview',
    'Edit Settings',
  ];

  List<Widget> changeWidget = [
    DataStorageOverview(
      dataAmount: 190,
      pDataAmount: 40,
      aDataAmount: 80,
      cDataAmount: 70,
      accountAge: 100,
      somellierAccuracy: 80,
    ),
    DataStorageEdit(
      settingName: 'Data & Storage',
    ),
  ];
  List<String> dataLabel = [
    'Home',
    'Search',
    'Account',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeScreenHeader(
            subText: 'Change your Settings',
            mainText: widget.settingName,
            boxWidth: 199,
          ),
          Positioned(
            left: 35,
            top: 125,
            child: SizedBox(
              height: 40,
              width: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: changeWidget.length,
                itemBuilder: (context, value) => GestureDetector(
                  onTap: () {
                    setState(() {
                      changeIndex = value;
                      print(changeIndex);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      width: 150,
                      height: 40,
                      decoration: value == changeIndex
                          ? BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            )
                          : BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                      child: Center(
                        child: Text(
                          changeLabel[value],
                          style: value == changeIndex
                              ? GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).indicatorColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              top: 195,
            ),
            child: changeWidget[changeIndex],
          ),
        ],
      ),
      bottomNavigationBar: SettingBottomNavigationBar(
        data: data,
        dataLabel: dataLabel,
      ),
    );
  }
}
