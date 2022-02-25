import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterSelectCard extends StatefulWidget {
  FilterSelectCard(
      {Key? key,
      required this.filterCategory,
      required this.filterSvg,
      required this.filterIndex,
      required this.appliedFilters,
      required this.textStyle})
      : super(key: key);
  List<String> filterCategory;
  List<String> filterSvg;
  int filterIndex;
  ValueNotifier<int> appliedFilters;
  TextStyle textStyle;
  @override
  FilterSelectCardState createState() => FilterSelectCardState();
}

class FilterSelectCardState extends State<FilterSelectCard> {
  Color filterColor = primaryColor;
  Color borderColor = quartiaryTextColor;
  Color svgColor = quartiaryTextColor;
  bool filterStat = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (filterStat == false) {
              filterColor = quartiaryTextColor;
              widget.textStyle = selTextStyle(context);
              borderColor = backgroundColor;
              svgColor = mainTextColor;
              widget.appliedFilters.value += 1;
              print(widget.appliedFilters);
            }
            if (filterStat == true) {
              filterColor = primaryColor;
              widget.textStyle = unTextStyle(context);
              borderColor = quartiaryTextColor;
              svgColor = quartiaryTextColor;
              widget.appliedFilters.value -= 1;
              print(widget.appliedFilters);
            }
            if (filterColor == primaryColor) {
              filterStat = false;
            }
            if (filterColor == quartiaryTextColor) {
              filterStat = true;
            }
          });
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 250,
              ),
              height: 47,
              width: 47,
              decoration: BoxDecoration(
                color: filterColor,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  widget.filterSvg[widget.filterIndex],
                  color: svgColor,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            Text(
              widget.filterCategory[widget.filterIndex],
              style: GoogleFonts.poppins(
                textStyle: widget.textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigFilterSelectCard extends StatefulWidget {
  BigFilterSelectCard({
    Key? key,
    required this.filterCategory,
    required this.filterSvg,
    required this.filterIndex,
    required this.appliedFilters,
    required this.textStyle,
  }) : super(key: key);
  List<String> filterCategory;
  List<String> filterSvg;
  int filterIndex;
  ValueNotifier<int> appliedFilters;
  TextStyle textStyle;
  @override
  _BigFilterSelectCardState createState() => _BigFilterSelectCardState();
}

class _BigFilterSelectCardState extends State<BigFilterSelectCard> {
  Color filterColor = primaryColor;
  Color borderColor = quartiaryTextColor;

  bool filterStat = false;

  List<String> selectedSvg = [
    'assets/icons/icons_purple/cooking_bc.svg',
    'assets/icons/icons_purple/wine_tasting_bc.svg',
    'assets/icons/icons_purple/eating_together_bc.svg',
  ];
  List<String> unselectedSvg = [
    'assets/icons/icons_purple/cooking.svg',
    'assets/icons/icons_purple/wine_tasting.svg',
    'assets/icons/icons_purple/eating together.svg'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (filterStat == false) {
              filterColor = quartiaryTextColor;
              widget.textStyle = selTextStyle(context);
              borderColor = backgroundColor;
              widget.filterSvg[widget.filterIndex] =
                  selectedSvg[widget.filterIndex];
              widget.appliedFilters.value += 1;
              print(widget.appliedFilters);
            }
            if (filterStat == true) {
              filterColor = primaryColor;
              widget.textStyle = unTextStyle(context);
              borderColor = quartiaryTextColor;
              widget.filterSvg[widget.filterIndex] =
                  unselectedSvg[widget.filterIndex];
              widget.appliedFilters.value -= 1;
              print(widget.appliedFilters);
            }
            if (filterColor == primaryColor) {
              filterStat = false;
            }
            if (filterColor == quartiaryTextColor) {
              filterStat = true;
            }
          });
        },
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 250,
              ),
              height: 90,
              width: 85,
              decoration: BoxDecoration(
                color: filterColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: borderColor,
                ),
              ),
            ),
            Positioned(
              top: 9,
              left: 14,
              child: SizedBox(
                height: 50,
                width: 60,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    widget.filterSvg[widget.filterIndex],
                    height: 50,
                    width: 51,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 64,
              left: 23,
              child: SizedBox(
                width: 39,
                height: 18,
                child: Text(
                  widget.filterCategory[widget.filterIndex],
                  style: GoogleFonts.poppins(
                    textStyle: widget.textStyle,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
