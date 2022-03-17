import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_2_food.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_2_wine.dart';
import 'package:wineapp/screens/home/main_screen.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_bottom_navigation_bar.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class AskSomellierStep1Screen extends StatefulWidget {
  AskSomellierStep1Screen({Key? key}) : super(key: key);

  @override
  State<AskSomellierStep1Screen> createState() =>
      _AskSomellierStep1ScreenState();
}

class _AskSomellierStep1ScreenState extends State<AskSomellierStep1Screen> {
  bool wineSelected = false;

  bool foodSelected = false;
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
          Padding(
            padding: const EdgeInsets.only(),
            child: HomeScreenHeader(
              boxWidth: 238,
              subText: 'Wine and Food',
              mainText: 'Ask your Somellier',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 172,
              top: 92,
            ),
            child: Text(
              'Step 1',
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
              left: 104,
            ),
            child: Text(
              'What are you looking for?',
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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  wineSelected = true;
                  foodSelected = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 150,
                width: 320,
                decoration: BoxDecoration(
                  color: wineSelected
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Ask Somellier for Wine 🍷',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
              top: 25,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  wineSelected = false;
                  foodSelected = true;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 150,
                width: 320,
                decoration: BoxDecoration(
                  color: foodSelected
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Ask Somellier for Food 🍽',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
              top: 91,
            ),
            child: SubmitSettingChangesButton(
              cancelText: 'Cancel',
              cancelOnTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    createRoute(
                      MainScreen(
                        pageIndex: 0,
                      ),
                    ),
                    (route) => false);
              },
              continueOnTap: () {
                if (wineSelected == true) {
                  Navigator.push(
                    context,
                    createRoute(
                      AskSomellierStep2WineScreen(),
                    ),
                  );
                } else if (foodSelected == true) {
                  Navigator.push(
                    context,
                    createRoute(
                      AskSomellierStep2FoodScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'You have to select one of the options above!',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Theme.of(context).indicatorColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  );
                }
              },
              buttonText: 'Continue',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 14,
              left: 171,
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
      bottomNavigationBar: SettingBottomNavigationBar(
        data: data,
        dataLabel: dataLabel,
        detailSetting: true,
      ),
    );
  }
}
