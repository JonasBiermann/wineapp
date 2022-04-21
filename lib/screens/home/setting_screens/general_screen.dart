import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/setting_screens_widgets/general/general_overview_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/general/general_edit_widget.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_bottom_navigation_bar.dart';

class GeneralSettingScreen extends StatefulWidget {
  GeneralSettingScreen({
    Key? key,
    required this.settingName,
  }) : super(key: key);
  String settingName;

  @override
  State<GeneralSettingScreen> createState() => _GeneralSettingScreenState();
}

class _GeneralSettingScreenState extends State<GeneralSettingScreen> {
  int changeIndex = 0;
  int pageIndex = 2;
  List<IconData> data = [
    CustomIcons.home,
    CustomIcons.search,
    CustomIcons.user,
  ];
  List<Widget> changeWidget = [
    GeneralOverview(
      name: 'Aurelie Hertrampf',
      imageAdress: 'assets/images/a+j1.jpeg',
      userName: 'huhuaurelie',
      userMail: 'aurelie@gmail.com',
      phoneNumber: '+49 1514 3174497',
      userAge: 15,
      userCountry: 'Germany',
      userGneder: 'Female',
      accountAge: 100,
    ),
    const GeneralEdit(),
  ];

  List<String> changeLabel = [
    'Overview',
    'Edit Settings',
  ];

  List<String> dataLabel = [
    'Home',
    'Search',
    'Account',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          HomeScreenHeader(
            subText: 'Change your Settings',
            mainText: 'General',
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
        detailSetting: false,
        data: data,
        dataLabel: dataLabel,
      ),
    );
  }
}
