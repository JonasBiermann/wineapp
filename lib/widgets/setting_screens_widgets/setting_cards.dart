import 'package:flutter/material.dart';
import 'package:wineapp/screens/home/setting_screens/data_storage_screen.dart';
import 'package:wineapp/screens/home/setting_screens/design_screen.dart';
import 'package:wineapp/screens/home/setting_screens/general_screen.dart';
import 'package:wineapp/screens/home/setting_screens/notifications_screen.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_card.dart';

class SettingCards extends StatelessWidget {
  const SettingCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: 388,
      child: SizedBox(
        height: 350,
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SettingCard(
              settingName: 'General',
              settingIcon: 'assets/icons/settings.svg',
              pageRoute: GeneralSettingScreen(
                settingName: 'General',
              ),
            ),
            SettingCard(
              settingName: 'Notifications',
              settingIcon: 'assets/icons/bell.svg',
              pageRoute: NotificationSettingScreen(
                settingName: 'Notifications',
              ),
            ),
            SettingCard(
              settingName: 'Design',
              settingIcon: 'assets/icons/palette.svg',
              pageRoute: DesignSettingScreen(
                settingName: 'Design',
              ),
            ),
            SettingCard(
              settingName: 'Data & Storage',
              settingIcon: 'assets/icons/folder.svg',
              pageRoute: DataStorageSettingsScreen(
                settingName: 'Data & Storage',
              ),
            ),
            SettingCard(
              settingName: 'Translate',
              settingIcon: 'assets/icons/subtitles.svg',
              pageRoute: GeneralSettingScreen(
                settingName: 'General',
              ),
            ),
            SettingCard(
              settingName: 'Write a Review',
              settingIcon: 'assets/icons/comment.svg',
              pageRoute: GeneralSettingScreen(
                settingName: 'General',
              ),
            ),
            SettingCard(
              settingName: 'Contact Us',
              settingIcon: 'assets/icons/envelope.svg',
              pageRoute: GeneralSettingScreen(
                settingName: 'General',
              ),
            ),
            SettingCard(
              settingName: 'About Us',
              settingIcon: 'assets/icons/info.svg',
              pageRoute: GeneralSettingScreen(
                settingName: 'General',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
