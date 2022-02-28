import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class UpgradePlan extends StatelessWidget {
  UpgradePlan({
    Key? key,
    required this.upgradePhrase,
  }) : super(key: key);
  String upgradePhrase;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 238,
          width: 320,
          child: Text(
            upgradePhrase,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Positioned(
          right: 8,
          child: SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              'assets/icons/general/info.svg',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Positioned(
          top: 38,
          child: Stack(
            children: [
              Container(
                height: 155,
                width: 153,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 29,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(
                    'assets/icons/general/check-2.svg',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 78,
                child: SizedBox(
                  height: 21,
                  width: 73,
                  child: Text(
                    'Basic Plan',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 69,
                top: 93,
                child: SizedBox(
                  height: 11,
                  width: 16,
                  child: Text(
                    'Free',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 7),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 108,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 14,
                      width: 87,
                      child: Text(
                        'Limited Somellier',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                      width: 87,
                      child: Text(
                        'Search Wines',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: mainTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                      width: 87,
                      child: Text(
                        'See Wine-Stats',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 41,
                top: 101.75,
                child: SizedBox(
                  height: 54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 4,
                        width: 4,
                        child: SvgPicture.asset(
                            'assets/icons/general/Ellipse 2.svg'),
                      ),
                      SizedBox(
                        height: 4,
                        width: 4,
                        child: SvgPicture.asset(
                            'assets/icons/general/Ellipse 2.svg'),
                      ),
                      SizedBox(
                        height: 4,
                        width: 4,
                        child: SvgPicture.asset(
                            'assets/icons/general/Ellipse 2.svg'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 167,
          top: 38,
          child: Stack(
            children: [
              Container(
                height: 155,
                width: 153,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 29,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(
                    'assets/icons/general/diamond.svg',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 78,
                child: SizedBox(
                  height: 21,
                  width: 100,
                  child: Text(
                    'Premium Plan',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 93,
                child: SizedBox(
                  height: 11,
                  width: 70,
                  child: Text(
                    'One-time purchase',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 7),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 108,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 14,
                      width: 88,
                      child: Text(
                        'Unlimited Somellier',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                      width: 88,
                      child: Text(
                        'Unlock Designs',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                      width: 88,
                      child: Text(
                        'No Ads',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 40,
                top: 101.75,
                child: SizedBox(
                  height: 54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 4,
                        width: 4,
                        child: SvgPicture.asset(
                          'assets/icons/general/Ellipse 2.svg',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                        width: 4,
                        child: SvgPicture.asset(
                          'assets/icons/general/Ellipse 2.svg',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                        width: 4,
                        child: SvgPicture.asset(
                          'assets/icons/general/Ellipse 2.svg',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 203,
          child: GestureDetector(
            onTap: () {
              print('I want to buy the premium plan!');
            },
            child: Stack(
              children: [
                Container(
                  height: 35,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
                Positioned(
                  left: 85,
                  top: 7,
                  child: SizedBox(
                    height: 21,
                    width: 151,
                    child: Text(
                      'Upgrade now - €3.29',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
