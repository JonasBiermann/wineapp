import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/search_screens_widgets/filter_select_card_widget.dart';
import 'package:wineapp/widgets/search_screens_widgets/slider_widget.dart';

class SearchBar extends StatefulWidget {
  SearchBar({
    Key? key,
    required this.appliedFilters,
  }) : super(key: key);
  ValueNotifier<int> appliedFilters;
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<String> filterCategory = [
    'Lunch',
    'Dinner',
    'Party',
    'Healthy',
    'Sweet',
    'Spicy',
  ];
  List<String> mainFilterCategory = [
    'Meals',
    'Wines',
    'Both',
  ];

  List<String> mainFilterSvg = [
    'assets/icons/icons_purple/cooking_normal_purple.svg',
    'assets/icons/icons_purple/wine_tasting_normal_purple.svg',
    'assets/icons/icons_purple/eating_together_normal_purple.svg'
  ];
  List<String> filterSvg = [
    'assets/icons/general/restaurant.svg',
    'assets/icons/general/turkey-2.svg',
    'assets/icons/general/glass-cheers.svg',
    'assets/icons/general/lettuce.svg',
    'assets/icons/general/candy.svg',
    'assets/icons/general/pepper.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: 125,
      child: Stack(
        children: [
          Container(
            height: 35,
            width: 290,
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
            left: 293 - 35,
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
          Padding(
            padding: const EdgeInsets.only(left: 300, top: 8),
            child: GestureDetector(
              onTap: () {
                widget.appliedFilters.value = 0;
                filterMealsAndWines(context);
              },
              child: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  'assets/icons/general/settings-sliders.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> filterMealsAndWines(BuildContext context) {
    ValueNotifier<int> appliedFilters = ValueNotifier(0);
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              height: 377,
              width: 390,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(35)),
            ),
            Positioned(
              top: 7,
              left: 190,
              child: GestureDetector(
                onPanDown: (details) {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 3,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 312,
              child: Container(
                height: 65,
                width: 390,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 328,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/general/cross-circle.svg',
                      color: Theme.of(context).indicatorColor,
                      height: 15,
                      width: 15,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 15,
              child: Text(
                'Filter your meals',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Positioned(
              left: 35,
              top: 52,
              child: Text(
                'Cooking time',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SliderWidget(),
            Positioned(
              top: 117,
              left: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigFilterSelectCard(
                    filterCategory: mainFilterCategory,
                    filterSvg: mainFilterSvg,
                    filterIndex: 0,
                    appliedFilters: appliedFilters,
                    textStyle: unTextStyle(context),
                    filterColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColorLight,
                  ),
                  BigFilterSelectCard(
                    filterCategory: mainFilterCategory,
                    filterSvg: mainFilterSvg,
                    filterIndex: 1,
                    appliedFilters: appliedFilters,
                    textStyle: unTextStyle(context),
                    filterColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColorLight,
                  ),
                  BigFilterSelectCard(
                    filterCategory: mainFilterCategory,
                    filterSvg: mainFilterSvg,
                    filterIndex: 2,
                    appliedFilters: appliedFilters,
                    textStyle: unTextStyle(context),
                    filterColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColorLight,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              top: 225,
              child: SizedBox(
                height: 65,
                width: 390,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 0,
                      appliedFilters: appliedFilters,
                      textStyle: unTextStyle(context),
                      filterColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColorLight,
                      svgColor: Theme.of(context).primaryColorLight,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 1,
                      appliedFilters: appliedFilters,
                      textStyle: unTextStyle(context),
                      filterColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColorLight,
                      svgColor: Theme.of(context).primaryColorLight,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 2,
                      appliedFilters: appliedFilters,
                      textStyle: unTextStyle(context),
                      filterColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColorLight,
                      svgColor: Theme.of(context).primaryColorLight,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 3,
                      appliedFilters: appliedFilters,
                      textStyle: unTextStyle(context),
                      filterColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColorLight,
                      svgColor: Theme.of(context).primaryColorLight,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 4,
                      appliedFilters: appliedFilters,
                      textStyle: unTextStyle(context),
                      filterColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColorLight,
                      svgColor: Theme.of(context).primaryColorLight,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 5,
                      appliedFilters: appliedFilters,
                      textStyle: unTextStyle(context),
                      filterColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColorLight,
                      svgColor: Theme.of(context).primaryColorLight,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 325,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 145,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Clear',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 210,
              top: 325,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 145,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Filter',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      top: 13,
                      child: SvgPicture.asset(
                        'assets/icons/general/settings-sliders.svg',
                        height: 14,
                        width: 14,
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                    Positioned(
                      left: 110,
                      top: 15,
                      child: Container(
                        height: 9,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: appliedFilters,
                          builder: (context, appliedFilters, _) {
                            return Center(
                              child: Text(
                                appliedFilters.toString(),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).indicatorColor,
                                    fontSize: 6,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
