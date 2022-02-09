import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class SettingCard extends StatelessWidget {
  SettingCard(
      {Key? key,
      required this.settingName,
      required this.settingIcon,
      required this.pageRoute})
      : super(key: key);

  String settingName;
  String settingIcon;
  Widget pageRoute;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageRoute,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 35,
            width: 320,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(
                      0,
                      3,
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 7,
            ),
            child: Text(
              settingName,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: mainTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 9,
              left: 288,
            ),
            child: SizedBox(
                height: 17,
                width: 17,
                child: SvgPicture.asset(settingIcon, color: mainTextColor)),
          ),
        ],
      ),
    );
  }
}
