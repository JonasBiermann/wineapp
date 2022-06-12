import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/screens/home/food_detail_screen.dart';
import 'package:wineapp/screens/home/wine_detail_screen.dart';

class PrefInformationCardWine extends StatefulWidget {
  PrefInformationCardWine({
    Key? key,
    required this.snapShotDocument,
    required this.cardColor,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  DocumentSnapshot snapShotDocument;
  Color cardColor;
  bool isSelected;
  VoidCallback onSelected;

  @override
  State<PrefInformationCardWine> createState() =>
      _PrefInformationCardWineState();
}

class _PrefInformationCardWineState extends State<PrefInformationCardWine> {
  Color backgroundColor(context, selected) {
    setState(() {
      if (widget.isSelected == true) {
        widget.cardColor = Theme.of(context).primaryColorLight;
      } else {
        widget.cardColor = Theme.of(context).primaryColor;
      }
    });
    return widget.cardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25,
      ),
      child: GestureDetector(
        onTap: widget.onSelected,
        child: Stack(
          children: [
            Container(
              height: 185,
              width: 320,
              decoration: BoxDecoration(
                color: backgroundColor(context, widget.isSelected),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: const Color(0xff000000).withOpacity(.25),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  35,
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: Container(
                height: 155,
                width: 138,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                    image: NetworkImage(widget.snapShotDocument['url']),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 170,
              child: SizedBox(
                height: 15,
                width: 125,
                child: Text(
                  widget.snapShotDocument['name'],
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Positioned(
              left: 257,
              top: 41,
              child: Text(
                'Cuisine',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Positioned(
              left: 170,
              top: 56,
              child: CuisineCard(
                wineCuisine: widget.snapShotDocument['use'][0],
                height: 25,
                width: 60,
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 9,
              ),
            ),
            Positioned(
              left: 236,
              top: 56,
              child: CuisineCard(
                wineCuisine: widget.snapShotDocument['use'][1],
                height: 25,
                width: 60,
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 9,
              ),
            ),
            Positioned(
              left: 271,
              top: 91,
              child: Text(
                'Price',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 170,
              top: 105,
              child: Container(
                height: 25,
                width: 125,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.snapShotDocument['rating'],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 145,
              left: 170,
              child: LearnMoreButton(
                wineDocument: widget.snapShotDocument,
                routeWidget:
                    WineDetailScreen(wineDocument: widget.snapShotDocument),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CuisineCard extends StatelessWidget {
  const CuisineCard({
    Key? key,
    required this.wineCuisine,
    required this.height,
    required this.width,
    required this.color,
    required this.fontSize,
  }) : super(key: key);

  final String wineCuisine;
  final double height;
  final double width;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          wineCuisine,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class LearnMoreButton extends StatelessWidget {
  LearnMoreButton(
      {Key? key, required this.wineDocument, required this.routeWidget})
      : super(key: key);
  DocumentSnapshot wineDocument;
  Widget routeWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          createRoute(
            routeWidget,
          ),
        );
      },
      child: Hero(
        tag: wineDocument['iD'],
        child: Stack(
          children: [
            Container(
              height: 25,
              width: 125,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            Positioned(
              left: 13,
              top: 5,
              child: Text(
                'Learn More',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 95.02,
              top: 4.55,
              child: SizedBox(
                height: 18,
                width: 11.37,
                child: SvgPicture.asset(
                  'assets/icons/general/arrow_right.svg',
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PrefInformationCardMeal extends StatefulWidget {
  PrefInformationCardMeal({
    Key? key,
    required this.snapShotDocument,
    required this.cardColor,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  DocumentSnapshot snapShotDocument;
  Color cardColor;
  bool isSelected;
  VoidCallback onSelected;

  @override
  State<PrefInformationCardWine> createState() =>
      _PrefInformationCardWineState();
}

class _PrefInformationCardMealState extends State<PrefInformationCardMeal> {
  Color backgroundColor(context, selected) {
    setState(() {
      if (widget.isSelected == true) {
        widget.cardColor = Theme.of(context).primaryColorLight;
      } else {
        widget.cardColor = Theme.of(context).primaryColor;
      }
    });
    return widget.cardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25,
      ),
      child: GestureDetector(
        onTap: widget.onSelected,
        child: Stack(
          children: [
            Container(
              height: 185,
              width: 320,
              decoration: BoxDecoration(
                color: backgroundColor(context, widget.isSelected),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: const Color(0xff000000).withOpacity(.25),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  35,
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: Container(
                height: 155,
                width: 138,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                    image: NetworkImage(widget.snapShotDocument['url']),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 170,
              child: SizedBox(
                height: 15,
                width: 125,
                child: Text(
                  widget.snapShotDocument['name'],
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Positioned(
              left: 257,
              top: 41,
              child: Text(
                'Cuisine',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Positioned(
              left: 170,
              top: 56,
              child: CuisineCard(
                wineCuisine: widget.snapShotDocument['type'],
                height: 25,
                width: 127,
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 9,
              ),
            ),
            Positioned(
              left: 271,
              top: 91,
              child: Text(
                'Price',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 170,
              top: 105,
              child: Container(
                height: 25,
                width: 125,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.snapShotDocument['rating'],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 145,
              left: 170,
              child: LearnMoreButton(
                wineDocument: widget.snapShotDocument,
                routeWidget:
                    FoodDetailScreen(mealDocument: widget.snapShotDocument),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
