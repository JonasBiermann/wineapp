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
    'assets/icons/cooking.svg',
    'assets/icons/wine_tasting.svg',
    'assets/icons/eating together.svg'
  ];
  List<String> filterSvg = [
    'assets/icons/restaurant.svg',
    'assets/icons/turkey-2.svg',
    'assets/icons/glass-cheers.svg',
    'assets/icons/lettuce.svg',
    'assets/icons/candy.svg',
    'assets/icons/pepper.svg',
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
              color: primaryColor,
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
                    textStyle: const TextStyle(
                        color: tertiaryTextColor,
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
              child: SvgPicture.asset('assets/icons/search.svg',
                  color: mainTextColor),
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
                  'assets/icons/settings-sliders.svg',
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
                  color: primaryColor, borderRadius: BorderRadius.circular(35)),
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
                    color: mainTextColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 312,
              child: Container(
                height: 65,
                width: 390,
                decoration: const BoxDecoration(
                  color: secondaryTextColor,
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
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/cross-circle.svg',
                      color: mainTextColor,
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
                  textStyle: const TextStyle(
                    color: mainTextColor,
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
                  textStyle: const TextStyle(
                    color: mainTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliderWidget(),
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
                  ),
                  BigFilterSelectCard(
                    filterCategory: mainFilterCategory,
                    filterSvg: mainFilterSvg,
                    filterIndex: 1,
                    appliedFilters: appliedFilters,
                  ),
                  BigFilterSelectCard(
                    filterCategory: mainFilterCategory,
                    filterSvg: mainFilterSvg,
                    filterIndex: 2,
                    appliedFilters: appliedFilters,
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
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 1,
                      appliedFilters: appliedFilters,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 2,
                      appliedFilters: appliedFilters,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 3,
                      appliedFilters: appliedFilters,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 4,
                      appliedFilters: appliedFilters,
                    ),
                    FilterSelectCard(
                      filterCategory: filterCategory,
                      filterSvg: filterSvg,
                      filterIndex: 5,
                      appliedFilters: appliedFilters,
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
                    color: secondaryTextColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: backgroundColor,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Clear',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: backgroundColor,
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
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Filter',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: mainTextColor,
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
                        'assets/icons/settings-sliders.svg',
                        height: 14,
                        width: 14,
                        color: mainTextColor,
                      ),
                    ),
                    Positioned(
                      left: 110,
                      top: 15,
                      child: Container(
                        height: 9,
                        width: 20,
                        decoration: BoxDecoration(
                          color: primaryColor,
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
                                  textStyle: const TextStyle(
                                    color: mainTextColor,
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
