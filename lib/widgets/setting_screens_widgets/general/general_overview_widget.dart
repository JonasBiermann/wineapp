import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/uprade_plan.dart';
import 'package:wineapp/widgets/setting_screens_widgets/general/user_info_card.dart';

class GeneralOverview extends StatelessWidget {
  GeneralOverview({
    Key? key,
    required this.name,
    required this.userName,
    required this.userMail,
    required this.phoneNumber,
    required this.userAge,
    required this.userCountry,
    required this.userGneder,
    required this.accountAge,
    required this.imageAdress,
  }) : super(key: key);
  String name;
  String imageAdress;
  String userName;
  String userMail;
  String phoneNumber;
  int userAge;
  String userCountry;
  String userGneder;
  int accountAge;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfoCard(
            name: name,
            imageAdress: imageAdress,
            userName: userName,
            userMail: userMail,
            phoneNumber: phoneNumber,
            userAge: userAge,
            userCountry: userCountry,
            userGneder: userGneder,
            accountAge: accountAge),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: UpgradePlan(
            upgradePhrase: 'Upgrade your Plan',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 17,
              width: 47,
              child: Center(
                child: Text(
                  'Go Back',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
