import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class PrefInformationCard extends StatelessWidget {
  const PrefInformationCard({
    Key? key,
    required this.wineName,
  }) : super(key: key);

  final String wineName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 175,
                width: 150,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 15,
                ),
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/spaghetti.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 130,
                  left: 20,
                ),
                child: SizedBox(
                  width: 110,
                  height: 14,
                  child: Text(
                    wineName,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 149,
                ),
                child: Text(
                  'Preparation time',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: mainTextColor,
                      fontSize: 7,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 103,
                  top: 149,
                ),
                child: Container(
                  width: 27,
                  height: 11,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '30min',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 5,
                          fontWeight: FontWeight.w600,
                          color: mainTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
