import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/screens/home/wine_detail_screen.dart';

class PrefInformationCard extends StatelessWidget {
  PrefInformationCard({
    Key? key,
    required this.wineDocument,
  }) : super(key: key);

  DocumentSnapshot wineDocument;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25,
      ),
      child: Stack(
        children: [
          Container(
            height: 175,
            width: 320,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
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
            left: 10,
            top: 10,
            child: Container(
              height: 155,
              width: 138,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: NetworkImage(wineDocument['wineURL']),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 155,
            child: SizedBox(
              height: 30,
              width: 140,
              child: Text(
                wineDocument['wineName'],
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Positioned(
            left: 261,
            top: 55,
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
            left: 198,
            top: 74,
            child: CuisineCard(
              wineCuisine: wineDocument['wineUse'][0],
              height: 21,
              width: 47,
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 7,
            ),
          ),
          Positioned(
            left: 250,
            top: 74,
            child: CuisineCard(
              wineCuisine: wineDocument['wineUse'][1],
              height: 21,
              width: 47,
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 7,
            ),
          ),
          Positioned(
            left: 250,
            top: 100,
            child: CuisineCard(
              wineCuisine: wineDocument['wineUse'][2],
              height: 21,
              width: 47,
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 7,
            ),
          ),
          Positioned(
              top: 132,
              left: 170,
              child: LearnMoreButton(wineDocument: wineDocument))
        ],
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class LearnMoreButton extends StatelessWidget {
  LearnMoreButton({
    Key? key,
    required this.wineDocument,
  }) : super(key: key);
  DocumentSnapshot wineDocument;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          createRoute(
            WineDetailScreen(wineDocument: wineDocument),
          ),
        );
      },
      child: Hero(
        tag: wineDocument['wineID'],
        child: Stack(
          children: [
            Container(
              height: 33,
              width: 125,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(90),
              ),
            ),
            Positioned(
              left: 13,
              top: 7,
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
              top: 8,
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
