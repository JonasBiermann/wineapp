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

class AskSomellierStep4Screen extends StatefulWidget {
  const AskSomellierStep4Screen({
    Key? key,
    required this.stepDescription,
    required this.wineOrMeal,
    required this.mealVSWine,
    required this.selectedCuisine,
  }) : super(key: key);

  final String wineOrMeal;
  final String stepDescription;
  final bool mealVSWine;
  final String selectedCuisine;

  @override
  State<AskSomellierStep4Screen> createState() =>
      _AskSomellierStep4ScreenState();
}

class _AskSomellierStep4ScreenState extends State<AskSomellierStep4Screen> {
  QueryDocumentSnapshot<Map<String, dynamic>>? _selectedSnapshot;
  List<String> dataLabel = [
    'Home',
    'Search',
    'Account',
  ];
  late Future resultsLoaded;
  List<IconData> data = [
    CustomIcons.home,
    CustomIcons.search,
    CustomIcons.user,
  ];

  getResults() async {
    var data = await FirebaseFirestore.instance
        .collection(widget.wineOrMeal)
        .where('type', isEqualTo: widget.selectedCuisine)
        .get();
    setState(() {
      allResults = data.docs;
    });
    filterResultsList();
    return data.docs;
  }

  List allResults = [];

  List filteredResults = [];

  onSearchChanged() {
    print(searchController.text);
    filterResultsList();
  }

  filterResultsList() {
    var showResults = [];

    if (searchController.text != '') {
      // we have a search parameter
      for (var searchSnapshot in allResults) {
        var name = searchSnapshot['name'].toLowerCase();

        if (name.contains(searchController.text.toLowerCase())) {
          showResults.add(searchSnapshot);
        }
      }
    } else {
      // we do not have a search parameter
      showResults = List.from(allResults);
    }
    setState(() {
      filteredResults = showResults;
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getResults();
  }

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
                      controller: searchController,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
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
              child: SizedBox(
                height: 370,
                width: 320,
                child: Center(
                  child: ListView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                    scrollDirection: Axis.vertical,
                    itemCount: filteredResults.length,
                    itemBuilder: (context, index) => widget.mealVSWine
                        ? PrefInformationCardWine(
                            snapShotDocument: filteredResults[index],
                            cardColor: Theme.of(context).primaryColor,
                            isSelected:
                                filteredResults[index] == _selectedSnapshot,
                            onSelected: () {
                              setState(() {
                                _selectedSnapshot = filteredResults[index];
                              });
                            },
                          )
                        : PrefInformationCardMeal(
                            snapShotDocument: filteredResults[index],
                            cardColor: Theme.of(context).primaryColor,
                            isSelected:
                                filteredResults[index] == _selectedSnapshot,
                            onSelected: () {
                              setState(() {
                                _selectedSnapshot = filteredResults[index];
                              });
                            },
                          ),
                  ),
                ),
              )),
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
                _selectedSnapshot != null
                    ? () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            createRoute(FindingRecommendationScreen(
                              snapshotName: _selectedSnapshot,
                            )),
                            (route) => false);
                      }
                    : null;
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
    );
  }
}
