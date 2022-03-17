import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/models/custom_icons_icons.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_1.dart';
import 'package:wineapp/screens/ask_somellier_screens/step_3.dart';
import 'package:wineapp/screens/home/main_screen.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_bottom_navigation_bar.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class AskSomellierStep2WineScreen extends StatelessWidget {
  AskSomellierStep2WineScreen({Key? key}) : super(key: key);
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
                    children: const [
                      ChooseCuisineCard(
                        cuisineName: '🇨🇳 Chinese',
                      ),
                      ChooseCuisineCard(
                        cuisineName: '🇲🇽 Mexican',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ChooseCuisineCard(
                        cuisineName: '🇬🇷 Greek',
                      ),
                      ChooseCuisineCard(
                        cuisineName: '🇮🇹 Italian',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ChooseCuisineCard(
                        cuisineName: '🇮🇳 Indian',
                      ),
                      ChooseCuisineCard(
                        cuisineName: '🇫🇷 French',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ChooseCuisineCard(
                        cuisineName: '🇹🇭 Thai',
                      ),
                      ChooseCuisineCard(
                        cuisineName: '🇪🇸 Hispanic',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ChooseCuisineCard(
                        cuisineName: '🇯🇵 Japanese',
                      ),
                      ChooseCuisineCard(
                        cuisineName: '🇩🇪 German',
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
              top: 98,
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
                    const AskSomellierStep3Screen(
                      stepDescription: 'Do you want to pick a specific wine?',
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
      bottomNavigationBar: SettingBottomNavigationBar(
        data: data,
        dataLabel: dataLabel,
        detailSetting: true,
      ),
    );
  }
}

class ChooseCuisineCard extends StatefulWidget {
  const ChooseCuisineCard({Key? key, required this.cuisineName})
      : super(key: key);
  final String cuisineName;
  @override
  ChooseCuisineCardState createState() => ChooseCuisineCardState();
}

class ChooseCuisineCardState extends State<ChooseCuisineCard> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
        child: Center(
          child: Text(
            widget.cuisineName,
            style: selected
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
      ),
    );
  }
}
