import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/constants.dart';

class SettingCard extends StatelessWidget {
  const SettingCard(
      {Key? key,
      required this.settingName,
      required this.settingIcon,
      required this.pageRoute})
      : super(key: key);

  final String settingName;
  final String settingIcon;
  final Widget pageRoute;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          createRoute(pageRoute),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 35,
            width: 320,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
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
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
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
                child: SvgPicture.asset(settingIcon,
                    color: Theme.of(context).colorScheme.primary)),
          ),
        ],
      ),
    );
  }
}
