import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_4.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class AskSomellierStep3Screen extends StatefulWidget {
  const AskSomellierStep3Screen(
      {Key? key,
      required this.stepDescription,
      required this.wineOrMeal,
      required this.mealVSWine,
      required this.selectedCuisine})
      : super(key: key);
  final String stepDescription;
  final String wineOrMeal;
  final bool mealVSWine;
  final String selectedCuisine;

  @override
  State<AskSomellierStep3Screen> createState() =>
      _AskSomellierStep3ScreenState();
}

class _AskSomellierStep3ScreenState extends State<AskSomellierStep3Screen> {
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
  bool specifyChoice = false;
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
              'Step 3',
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
              left: 65,
            ),
            child: Text(
              widget.stepDescription,
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
                  specifyChoice = true;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 150,
                width: 320,
                decoration: BoxDecoration(
                  color: specifyChoice
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Yes please 👍',
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
                  specifyChoice = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 150,
                width: 320,
                decoration: BoxDecoration(
                  color: specifyChoice
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: Center(
                  child: Text(
                    'No thank you 😊',
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
              top: 146,
            ),
            child: SubmitSettingChangesButton(
              buttonText: 'Continue',
              cancelText: 'Cancel',
              cancelOnTap: () {
                Navigator.pop(context);
              },
              continueOnTap: () {
                if (specifyChoice == true) {
                  Navigator.push(
                    context,
                    createRoute(
                      AskSomellierStep4Screen(
                        mealVSWine: widget.mealVSWine,
                        stepDescription: widget.mealVSWine
                            ? 'Search for your wine below'
                            : 'Search for your meal below',
                        wineOrMeal: widget.wineOrMeal,
                        selectedCuisine: widget.selectedCuisine,
                      ),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
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
      // bottomNavigationBar: SettingBottomNavigationBar(
      //   data: data,
      //   dataLabel: dataLabel,
      //   detailSetting: true,
      // ),
    );
  }
}
