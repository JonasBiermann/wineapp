import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class UserNotificationInfoWidget extends StatelessWidget {
  UserNotificationInfoWidget({
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
  String notificationTrue = 'Get Notified';
  String notificationFalse = 'No Notifications';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 253,
          width: 320,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
          ),
          child: Text(
            'Notifications',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 52,
          ),
          child: Text(
            'Email',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 80,
          ),
          child: Text(
            'Phone',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 108,
          ),
          child: Text(
            'Somellier',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 136,
          ),
          child: Text(
            'Meal Suggestions',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 164,
          ),
          child: Text(
            'Invitations',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 192,
          ),
          child: Text(
            'Deals & Offers',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 220,
          ),
          child: Text(
            'App News',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 52,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: Text(
              userMail,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: mainTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 80,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: Text(
              phoneNumber,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: mainTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 108,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: (somellierStatus == true)
                ? Text(
                    notificationTrue,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  )
                : Text(
                    notificationFalse,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 136,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: (mealSuggestionStatus == true)
                ? Text(
                    notificationTrue,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  )
                : Text(
                    notificationFalse,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 164,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: (inviationStatus == true)
                ? Text(
                    notificationTrue,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  )
                : Text(
                    notificationFalse,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 192,
          ),
          child: SizedBox(
            height: 18,
            width: 155,
            child: (dealStatus == true)
                ? Text(
                    notificationTrue,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  )
                : Text(
                    notificationFalse,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 220,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: (newStatus == true)
                ? Text(
                    notificationTrue,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  )
                : Text(
                    notificationFalse,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: mainTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  ),
          ),
        ),
      ],
    );
  }
}
