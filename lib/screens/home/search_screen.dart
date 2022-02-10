import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/search_screens/pref_search_results/dinner_pref_search.dart';
import 'package:wineapp/screens/search_screens/pref_search_results/lunch_pref_search.dart';
import 'package:wineapp/screens/search_screens/pref_search_results/party_pref_search.dart';
import 'package:wineapp/screens/search_screens/pref_search_results/wine_pref_search.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/search_screens_widgets/pref_information_card.dart';
import '../../widgets/search_screens_widgets/search_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Color filterColor = backgroundColor;
  bool filterStat = false;
  int prefIndex = 0;
  List<String> prefSearch = [
    '🍴 Lunch',
    '🍝 Dinner',
    '🍾 Party',
    '🥬 Healthy',
    '🍬 Sweet',
    '🌶 Spicy',
  ];
  List<Widget> prefResultWidgets = <Widget>[
    WinePrefResults(),
    LunchPrefResults(),
    DinnerPrefResults(),
    PartyPrefResults(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                HomeScreenHeader(
                  subText: 'Explore',
                  mainText: 'Wine and Food',
                  boxWidth: 184,
                ),
                SearchBar(
                  appliedFilters: ValueNotifier<int>(0),
                ),
                Positioned(
                  left: 35,
                  top: 172,
                  child: SizedBox(
                    width: 400,
                    height: 25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FilterCard(prefSearch: prefSearch, prefIndex: 0),
                        FilterCard(prefSearch: prefSearch, prefIndex: 1),
                        FilterCard(prefSearch: prefSearch, prefIndex: 2),
                        FilterCard(prefSearch: prefSearch, prefIndex: 3),
                        FilterCard(prefSearch: prefSearch, prefIndex: 4),
                        FilterCard(prefSearch: prefSearch, prefIndex: 5),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  top: 215,
                  child: SizedBox(
                    height: 78,
                    width: 160,
                    child: Text(
                      'Found 40 results',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: mainTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  top: 303,
                  child: SizedBox(
                    height: 1000,
                    width: 150,
                    child: Column(
                      children: const [
                        PrefInformationCard(
                          wineName: 'Healthy',
                        ),
                        PrefInformationCard(
                          wineName: 'Healthy',
                        ),
                        PrefInformationCard(
                          wineName: 'Helathy',
                        ),
                        PrefInformationCard(
                          wineName: 'Healthy',
                        ),
                        PrefInformationCard(
                          wineName: 'Healthy',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 210,
                    top: 218,
                  ),
                  child: SizedBox(
                    height: 1000,
                    width: 150,
                    child: Column(
                      children: const [
                        PrefInformationCard(
                          wineName: 'Spaghetti',
                        ),
                        PrefInformationCard(
                          wineName: 'Spaghetti',
                        ),
                        PrefInformationCard(
                          wineName: 'Spaghetti',
                        ),
                        PrefInformationCard(
                          wineName: 'Spaghetti',
                        ),
                        PrefInformationCard(
                          wineName: 'Spaghetti',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterCard extends StatefulWidget {
  FilterCard({
    Key? key,
    required this.prefSearch,
    required this.prefIndex,
  }) : super(key: key);
  List<String> prefSearch;
  int prefIndex;
  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  Color filterColor = backgroundColor;
  bool filterStat = false;

  TextStyle textStyle = unTextStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (filterStat == false) {
                filterColor = primaryColor;
                textStyle = selTextStyle;
              }
              if (filterStat == true) {
                filterColor = backgroundColor;
                textStyle = unTextStyle;
              }
              if (filterColor == backgroundColor) {
                filterStat = false;
              }
              if (filterColor == primaryColor) {
                filterStat = true;
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 250,
            ),
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: filterColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: primaryColor),
            ),
            child: Center(
              child: Text(
                widget.prefSearch[widget.prefIndex],
                style: GoogleFonts.poppins(textStyle: textStyle),
              ),
            ),
          ),
        ));
  }
}
