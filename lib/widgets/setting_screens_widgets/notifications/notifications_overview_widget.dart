import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/uprade_plan.dart';
import 'package:wineapp/widgets/setting_screens_widgets/notifications/user_notification_info_widget.dart';

class NotificationOverview extends StatelessWidget {
  NotificationOverview({
    Key? key,
    required this.userMail,
    required this.phoneNumber,
    required this.somellierStatus,
    required this.mealSuggestionStatus,
    required this.inviationStatus,
    required this.dealStatus,
    required this.newStatus,
  }) : super(key: key);
  String userMail;
  String phoneNumber;
  bool somellierStatus;
  bool mealSuggestionStatus;
  bool inviationStatus;
  bool dealStatus;
  bool newStatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserNotificationInfoWidget(
            userMail: userMail,
            phoneNumber: phoneNumber,
            somellierStatus: somellierStatus,
            mealSuggestionStatus: mealSuggestionStatus,
            inviationStatus: inviationStatus,
            dealStatus: dealStatus,
            newStatus: newStatus),
        Padding(
          padding: const EdgeInsets.only(
            top: 25,
          ),
          child: UpgradePlan(
            upgradePhrase: 'Get Exclusive Offers',
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
                    textStyle: const TextStyle(
                      color: mainTextColor,
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
