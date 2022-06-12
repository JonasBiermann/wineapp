import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_2_wine.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_3.dart';

import '../../animation/page_route_transition.dart';
import '../../models/custom_icons_icons.dart';
import '../../widgets/home_screens_widgets/home_screen_header.dart';
import '../../widgets/setting_screens_widgets/submit_changes_button.dart';
import '../home/main_screen.dart';

class AskSomellierStep2FoodScreen extends StatefulWidget {
  const AskSomellierStep2FoodScreen({Key? key}) : super(key: key);

  @override
  State<AskSomellierStep2FoodScreen> createState() =>
      _AskSomellierStep2FoodScreenState();
}

class _AskSomellierStep2FoodScreenState
    extends State<AskSomellierStep2FoodScreen> {
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

  List<bool> wineTypes = [
    false,
    false,
    false,
    false,
    false,
  ];
  String selectedWine = '';
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
              'Step 2',
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
              left: 43,
            ),
            child: Text(
              'What kind of Wine are you enjoying today?',
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
              left: 62,
              top: 35,
            ),
            child: SizedBox(
              height: 311,
              width: 268,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedWine = 'Red Wine';
                        wineTypes[0] = true;
                        wineTypes[1] = false;
                        wineTypes[2] = false;
                        wineTypes[3] = false;
                        wineTypes[4] = false;
                      });
                      print(selectedWine);
                    },
                    child: ChooseCuisineCard(
                      cuisineName: 'Red Wine',
                      width: 266,
                      selected: wineTypes[0],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedWine = 'White Wine';
                        wineTypes[0] = false;
                        wineTypes[1] = true;
                        wineTypes[2] = false;
                        wineTypes[3] = false;
                        wineTypes[4] = false;
                      });
                      print(selectedWine);
                    },
                    child: ChooseCuisineCard(
                      cuisineName: 'White Wine',
                      width: 266,
                      selected: wineTypes[1],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedWine = 'Rosé Wine';
                        wineTypes[0] = false;
                        wineTypes[1] = false;
                        wineTypes[2] = true;
                        wineTypes[3] = false;
                        wineTypes[4] = false;
                      });
                      print(selectedWine);
                    },
                    child: ChooseCuisineCard(
                      cuisineName: 'Rosé Wine',
                      width: 266,
                      selected: wineTypes[2],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedWine = 'Sparkling Wine';
                        wineTypes[0] = false;
                        wineTypes[1] = false;
                        wineTypes[2] = false;
                        wineTypes[3] = true;
                        wineTypes[4] = false;
                      });
                      print(selectedWine);
                    },
                    child: ChooseCuisineCard(
                      cuisineName: 'Sparkling Wine',
                      width: 266,
                      selected: wineTypes[3],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedWine = 'Dessert Wine';
                        wineTypes[0] = false;
                        wineTypes[1] = false;
                        wineTypes[2] = false;
                        wineTypes[3] = false;
                        wineTypes[4] = true;
                      });
                      print(selectedWine);
                    },
                    child: ChooseCuisineCard(
                      cuisineName: 'Dessert Wine',
                      width: 266,
                      selected: wineTypes[4],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              top: 153,
            ),
            child: SubmitSettingChangesButton(
              buttonText: 'Continue',
              cancelText: 'Cancel',
              cancelOnTap: () {
                Navigator.pushAndRemoveUntil(context,
                    createRoute(MainScreen(pageIndex: 0)), (route) => false);
              },
              continueOnTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    AskSomellierStep3Screen(
                      stepDescription: 'Do you want to pick a specific wine?',
                      wineOrMeal: 'wines',
                      mealVSWine: true,
                      selectedCuisine: selectedWine,
                    ),
                  ),
                );
              },
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
    );
  }
}
