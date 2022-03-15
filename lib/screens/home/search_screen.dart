import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/search_screens_widgets/pref_information_card.dart';
import '../../widgets/search_screens_widgets/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool filterStat = false;
  int prefIndex = 0;
  List<String> prefSearch = [
    '🇪🇸 Hispanic',
    '🇮🇹 Italian',
    '🇩🇪 German',
    '🇲🇽 Mexican',
    '🇬🇷 Greek',
    '🇫🇷 French',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeScreenHeader(
              subText: 'Explore',
              mainText: 'Wine and Cuisines',
              boxWidth: 220,
            ),
            SearchBar(
              appliedFilters: ValueNotifier<int>(0),
            ),
            Stack(
              children: [
                Container(
                  height: 123,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                Positioned(
                  left: 35,
                  top: 10,
                  child: SizedBox(
                    width: 400,
                    height: 25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FilterCard(
                          prefSearch: prefSearch,
                          prefIndex: 0,
                          textStyle: unTextStyle(context),
                          filterColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                        FilterCard(
                          prefSearch: prefSearch,
                          prefIndex: 1,
                          textStyle: unTextStyle(context),
                          filterColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                        FilterCard(
                          prefSearch: prefSearch,
                          prefIndex: 2,
                          textStyle: unTextStyle(context),
                          filterColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                        FilterCard(
                          prefSearch: prefSearch,
                          prefIndex: 3,
                          textStyle: unTextStyle(context),
                          filterColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                        FilterCard(
                          prefSearch: prefSearch,
                          prefIndex: 4,
                          textStyle: unTextStyle(context),
                          filterColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                        FilterCard(
                          prefSearch: prefSearch,
                          prefIndex: 5,
                          textStyle: unTextStyle(context),
                          filterColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  top: 45,
                  child: SizedBox(
                    height: 78,
                    width: 160,
                    child: Center(
                      child: Text(
                        'Found 40 results',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).indicatorColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('wines')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return SizedBox(
                      width: 320,
                      height: snapshot.data!.docs.length * 220,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) => PrefInformationCard(
                            wineDocument: snapshot.data!.docs[index],
                          ),
                        ),
                      ),
                    );
                  }),
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
    required this.textStyle,
    required this.filterColor,
  }) : super(key: key);
  List<String> prefSearch;
  int prefIndex;
  TextStyle textStyle;
  Color filterColor;
  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  bool filterStat = false;

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
                widget.filterColor = Theme.of(context).primaryColor;
                widget.textStyle = selTextStyle(context);
              }
              if (filterStat == true) {
                widget.filterColor = Theme.of(context).scaffoldBackgroundColor;
                widget.textStyle = unTextStyle(context);
              }
              filterStat = !filterStat;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 250,
            ),
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: widget.filterColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: Center(
              child: Text(
                widget.prefSearch[widget.prefIndex],
                style: GoogleFonts.poppins(textStyle: widget.textStyle),
              ),
            ),
          ),
        ));
  }
}
