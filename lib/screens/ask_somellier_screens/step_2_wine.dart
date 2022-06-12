import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_3.dart';
import 'package:wineapp/screens/home/main_screen.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class AskSomellierStep2WineScreen extends StatefulWidget {
  const AskSomellierStep2WineScreen({Key? key}) : super(key: key);

  @override
  State<AskSomellierStep2WineScreen> createState() =>
      _AskSomellierStep2WineScreenState();
}

class _AskSomellierStep2WineScreenState
    extends State<AskSomellierStep2WineScreen> {
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
  List<bool> cuisines = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  String selectedCuisine = '';
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
              left: 60,
            ),
            child: Text(
              'What Cuisine are you enjoying today?',
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
              top: 32,
            ),
            child: SizedBox(
              height: 311,
              width: 266,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇨🇳 Chinese';
                            cuisines[0] = true;
                            cuisines[1] = false;
                            cuisines[2] = false;
                            cuisines[3] = false;
                            cuisines[4] = false;
                            cuisines[5] = false;
                            cuisines[6] = false;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇨🇳 Chinese',
                          width: 120,
                          selected: cuisines[0],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇲🇽 Mexican';
                            cuisines[0] = false;
                            cuisines[1] = true;
                            cuisines[2] = false;
                            cuisines[3] = false;
                            cuisines[4] = false;
                            cuisines[5] = false;
                            cuisines[6] = false;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇲🇽 Mexican',
                          width: 120,
                          selected: cuisines[1],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇬🇷 Greek';
                            cuisines[0] = false;
                            cuisines[1] = false;
                            cuisines[2] = true;
                            cuisines[3] = false;
                            cuisines[4] = false;
                            cuisines[5] = false;
                            cuisines[6] = false;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇬🇷 Greek',
                          width: 120,
                          selected: cuisines[2],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇮🇹 Italian';
                            cuisines[0] = false;
                            cuisines[1] = false;
                            cuisines[2] = false;
                            cuisines[3] = true;
                            cuisines[4] = false;
                            cuisines[5] = false;
                            cuisines[6] = false;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇮🇹 Italian',
                          width: 120,
                          selected: cuisines[3],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇮🇳 Indian';
                            cuisines[0] = false;
                            cuisines[1] = false;
                            cuisines[2] = false;
                            cuisines[3] = false;
                            cuisines[4] = true;
                            cuisines[5] = false;
                            cuisines[6] = false;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇮🇳 Indian',
                          width: 120,
                          selected: cuisines[4],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇫🇷 French';
                            cuisines[0] = false;
                            cuisines[1] = false;
                            cuisines[2] = false;
                            cuisines[3] = false;
                            cuisines[4] = false;
                            cuisines[5] = true;
                            cuisines[6] = false;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇫🇷 French',
                          width: 120,
                          selected: cuisines[5],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇹🇭 Thai';
                            cuisines[0] = false;
                            cuisines[1] = false;
                            cuisines[2] = false;
                            cuisines[3] = false;
                            cuisines[4] = false;
                            cuisines[5] = false;
                            cuisines[6] = true;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇹🇭 Thai',
                          width: 120,
                          selected: cuisines[6],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇪🇸 Hispanic';
                            cuisines[0] = false;
                            cuisines[1] = false;
                            cuisines[2] = false;
                            cuisines[3] = false;
                            cuisines[4] = false;
                            cuisines[5] = false;
                            cuisines[6] = false;
                            cuisines[7] = true;
                            cuisines[8] = false;
                            cuisines[9] = false;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇪🇸 Hispanic',
                          width: 120,
                          selected: cuisines[7],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇯🇵 Japanese';
                          });
                          print(selectedCuisine);
                          cuisines[0] = true;
                          cuisines[1] = false;
                          cuisines[2] = false;
                          cuisines[3] = false;
                          cuisines[4] = false;
                          cuisines[5] = false;
                          cuisines[6] = false;
                          cuisines[7] = false;
                          cuisines[8] = true;
                          cuisines[9] = false;
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇯🇵 Japanese',
                          width: 120,
                          selected: cuisines[8],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCuisine = '🇩🇪 German';
                            cuisines[0] = false;
                            cuisines[1] = false;
                            cuisines[2] = false;
                            cuisines[3] = false;
                            cuisines[4] = false;
                            cuisines[5] = false;
                            cuisines[6] = false;
                            cuisines[7] = false;
                            cuisines[8] = false;
                            cuisines[9] = true;
                          });
                          print(selectedCuisine);
                        },
                        child: ChooseCuisineCard(
                          cuisineName: '🇩🇪 German',
                          width: 120,
                          selected: cuisines[9],
                        ),
                      )
                    ],
                  )
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
                      stepDescription: 'Do you want to pick a specific meal?',
                      wineOrMeal: 'meals',
                      mealVSWine: false,
                      selectedCuisine: selectedCuisine,
                    ),
                  ),
                );
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
                height: 17,
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

class ChooseCuisineCard extends StatefulWidget {
  ChooseCuisineCard(
      {Key? key,
      required this.cuisineName,
      required this.width,
      required this.selected})
      : super(key: key);
  final String cuisineName;
  final double width;
  bool selected;
  @override
  ChooseCuisineCardState createState() => ChooseCuisineCardState();
}

class ChooseCuisineCardState extends State<ChooseCuisineCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 50,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.selected
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(
          7,
        ),
      ),
      child: Center(
        child: Text(
          widget.cuisineName,
          style: widget.selected
              ? GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
