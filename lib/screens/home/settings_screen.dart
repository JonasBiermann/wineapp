import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_cards.dart';
import 'package:wineapp/widgets/uprade_plan.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          HomeScreenHeader(
            subText: 'Your Account',
            mainText: 'Aurelie',
            boxWidth: 184,
          ),
          const Positioned(
            left: 318,
            top: 50,
            child: SizedBox(
              height: 37,
              width: 37,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/a+j1.jpeg'),
              ),
            ),
          ),
          Positioned(
            left: 35,
            top: 125,
            child: UpgradePlan(
              upgradePhrase: 'Upgrade your Plan',
            ),
          ),
          const SettingCards(),
        ],
      ),
    );
  }
}
