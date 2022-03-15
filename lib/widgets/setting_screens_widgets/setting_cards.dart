import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:wineapp/animation/page_route_transition.dart';
import 'package:wineapp/screens/home/setting_screens/data_storage_screen.dart';
import 'package:wineapp/screens/home/setting_screens/design_screen.dart';
import 'package:wineapp/screens/home/setting_screens/general_screen.dart';
import 'package:wineapp/screens/home/setting_screens/notifications_screen.dart';
import 'package:wineapp/services/auth_services.dart';
import 'package:wineapp/widgets/setting_screens_widgets/setting_card.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingCards extends StatelessWidget {
  const SettingCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: SizedBox(
        height: 350,
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SettingCard(
                settingName: 'General',
                settingIcon: 'assets/icons/general/settings.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    createRoute(
                      GeneralSettingScreen(
                        settingName: 'General',
                      ),
                    ),
                  );
                }),
            SettingCard(
              settingName: 'Notifications',
              settingIcon: 'assets/icons/general/bell.svg',
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    NotificationSettingScreen(
                      settingName: 'Notifications',
                    ),
                  ),
                );
              },
            ),
            SettingCard(
              settingName: 'Design',
              settingIcon: 'assets/icons/general/palette.svg',
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    DesignSettingScreen(
                      settingName: 'Deisgn',
                    ),
                  ),
                );
              },
            ),
            SettingCard(
              settingName: 'Data & Storage',
              settingIcon: 'assets/icons/general/folder.svg',
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    GeneralSettingScreen(
                      settingName: 'General',
                    ),
                  ),
                );
              },
            ),
            SettingCard(
              settingName: 'Translate',
              settingIcon: 'assets/icons/general/subtitles.svg',
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    GeneralSettingScreen(
                      settingName: 'General',
                    ),
                  ),
                );
              },
            ),
            SettingCard(
              settingName: 'Write a Review',
              settingIcon: 'assets/icons/general/comment.svg',
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    GeneralSettingScreen(
                      settingName: 'General',
                    ),
                  ),
                );
              },
            ),
            SettingCard(
                settingName: 'Contact Us',
                settingIcon: 'assets/icons/general/envelope.svg',
                onTap: () {
                  launchEmail(
                      context,
                      'jojabiermann@icloud.com',
                      'Request WineApp',
                      'Hi there, I have a request considering...');
                }),
            SettingCard(
              settingName: 'Sign Out',
              settingIcon: 'assets/icons/general/sign-out-alt.svg',
              onTap: () {
                AuthService().logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MailClientOpenErrorDialog extends StatelessWidget {
  final String url;

  const MailClientOpenErrorDialog({Key? key, required this.url})
      : assert(url != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Launch Error'),
      content: Text('We could not launch the following url:\n$url'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void launchEmail(context, toEmail, subject, message) async {
  var url =
      'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
  if (Platform.isIOS) {
    url = 'mailto:jojabiermann@icloud.com';
  }
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showCupertinoDialog(
        context: context, builder: MailClientOpenErrorDialog(url: url).build);
  }
}
