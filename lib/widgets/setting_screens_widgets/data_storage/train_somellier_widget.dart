import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainSomellierWidget extends StatelessWidget {
  const TrainSomellierWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 198,
          width: 320,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              25,
            ),
            border: Border.all(
              width: 2,
              color: primaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: SizedBox(
            height: 24,
            width: 124,
            child: Text(
              'Train Somellier',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 48,
          ),
          child: Container(
            height: 134,
            width: 290,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(
                25,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 45,
            top: 101,
          ),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                'assets/icons/general/thumbs-up.svg',
                color: mainTextColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 245,
            top: 101,
          ),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                'assets/icons/general/thumbs-down.svg',
                color: mainTextColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 105,
            top: 61,
          ),
          child: Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/wine.jpg',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                25,
              ),
            ),
          ),
        )
      ],
    );
  }
}
