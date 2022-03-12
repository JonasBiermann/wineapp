import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/models/wine_model.dart';

class PrefInformationCard extends StatelessWidget {
  const PrefInformationCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final WineModel model;

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
                  color: Color(0xff000000).withOpacity(.25),
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
                  image: AssetImage(model.imageURL),
                  fit: BoxFit.cover,
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
                model.wineName,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).indicatorColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              wineCuisine: model.wineUse[0],
              height: 21,
              width: 47,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Positioned(
            left: 250,
            top: 74,
            child: CuisineCard(
              wineCuisine: model.wineUse[1],
              height: 21,
              width: 47,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Positioned(
            left: 250,
            top: 100,
            child: CuisineCard(
              wineCuisine: model.wineUse[2],
              height: 21,
              width: 47,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          const Positioned(top: 132, left: 170, child: LearnMoreButton())
        ],
      ),
      // child: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         Container(
      //           height: 175,
      //           width: 150,
      //           decoration: BoxDecoration(
      //             color: Theme.of(context).primaryColor,
      //             borderRadius: BorderRadius.circular(25),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(
      //             left: 20,
      //             top: 15,
      //           ),
      //           child: Container(
      //             height: 110,
      //             width: 110,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(
      //                 40,
      //               ),
      //               image: DecorationImage(
      //                 image: AssetImage(
      //                   model.imageURL,
      //                 ),
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(
      //             top: 130,
      //             left: 20,
      //           ),
      //           child: SizedBox(
      //             width: 110,
      //             height: 14,
      //             child: Text(
      //               model.wineName,
      //               style: GoogleFonts.poppins(
      //                 textStyle: TextStyle(
      //                   color: Theme.of(context).indicatorColor,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 9,
      //                 ),
      //               ),
      //               textAlign: TextAlign.left,
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(
      //             left: 20,
      //             top: 149,
      //           ),
      //           child: Text(
      //             'Preparation time',
      //             style: GoogleFonts.poppins(
      //               textStyle: TextStyle(
      //                 color: Theme.of(context).indicatorColor,
      //                 fontSize: 7,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(
      //             left: 103,
      //             top: 149,
      //           ),
      //           child: Container(
      //             width: 27,
      //             height: 11,
      //             decoration: BoxDecoration(
      //               color: Theme.of(context).scaffoldBackgroundColor,
      //               borderRadius: BorderRadius.circular(
      //                 10,
      //               ),
      //             ),
      //             child: Center(
      //               child: Text(
      //                 model.prepTime.toString(),
      //                 style: GoogleFonts.poppins(
      //                   textStyle: TextStyle(
      //                     fontSize: 5,
      //                     fontWeight: FontWeight.w600,
      //                     color: Theme.of(context).indicatorColor,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
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
  }) : super(key: key);

  final String wineCuisine;
  final double height;
  final double width;
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
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 7,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
    );
  }
}
