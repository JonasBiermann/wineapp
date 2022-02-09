import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class LatestMealCard extends StatefulWidget {
  const LatestMealCard({Key? key}) : super(key: key);

  @override
  _LatestMealCardState createState() => _LatestMealCardState();
}

class _LatestMealCardState extends State<LatestMealCard> {
  int tasteIndex = 2;
  List<String> icondata = [
    'assets/icons/sad.svg',
    'assets/icons/smile.svg',
    'assets/icons/grin-stars.svg',
  ];
  List<String> labeldata = [
    'Not really...',
    'Yes it did!',
    'Perfectly!',
  ];
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: 125,
      child: Stack(
        children: [
          Container(
            height: 320,
            width: 320,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: Offset(
                    0,
                    6,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 62 - 35,
            top: 139 - 125,
            child: SizedBox(
              height: 30,
              width: 116,
              child: Text(
                'Latest Meal',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: mainTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 53 - 35,
            top: 183 - 125,
            child: Container(
              height: 135,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/spaghetti.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            left: 202 - 35,
            top: 183 - 125,
            child: Container(
              height: 135,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: const DecorationImage(
                    image: AssetImage('assets/images/wine.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            left: 53 - 35,
            top: 327 - 125,
            child: SizedBox(
              height: 54,
              width: 284,
              child: Text(
                'Your most recent meal was psaghetti and your personal somellier suggested red wine.\nDid it matche the taste?',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: mainTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            left: 53 - 35,
            top: 392 - 125,
            child: SizedBox(
              height: 20,
              width: 254,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: icondata.length,
                itemBuilder: (context, value) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tasteIndex = value;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      decoration: value == tasteIndex
                          ? BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(90),
                            )
                          : BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(90),
                            ),
                      child: SizedBox(
                        width: 46,
                        height: 22,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 1,
                          ),
                          child: SvgPicture.asset(icondata[value],
                              color: value == tasteIndex
                                  ? mainTextColor
                                  : secondaryTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 68 - 46,
            top: 417 - 125,
            child: SizedBox(
              height: 14,
              width: 252,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: labeldata.length,
                itemBuilder: (context, value) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17.5,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tasteIndex = value;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1,
                        ),
                        child: SizedBox(
                          height: 14,
                          width: 53,
                          child: Text(
                            (labeldata[value]),
                            textAlign: TextAlign.right,
                            style: GoogleFonts.poppins(
                              textStyle: value == tasteIndex
                                  ? const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mainTextColor,
                                      fontSize: 9)
                                  : const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: secondaryTextColor,
                                      fontSize: 9),
                            ),
                          ),
                        ),
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
