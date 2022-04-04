import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfoCard extends StatefulWidget {
  UserInfoCard({
    Key? key,
    required this.name,
    required this.imageAdress,
    required this.userName,
    required this.userMail,
    required this.phoneNumber,
    required this.userAge,
    required this.userCountry,
    required this.userGneder,
    required this.accountAge,
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
  State<UserInfoCard> createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 256,
          width: 320,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: Text(
            widget.name,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 281,
          ),
          child: SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.imageAdress),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 52,
          ),
          child: SizedBox(
            height: 18,
            width: 64,
            child: Text(
              'Username',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 80,
          ),
          child: SizedBox(
            height: 18,
            width: 34,
            child: Text(
              'Email',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 108,
          ),
          child: SizedBox(
            height: 18,
            width: 39,
            child: Text(
              'Phone',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 136,
          ),
          child: SizedBox(
            height: 18,
            width: 25,
            child: Text(
              'Age',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 164,
          ),
          child: SizedBox(
            height: 18,
            width: 50,
            child: Text(
              'Country',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 197,
          ),
          child: SizedBox(
            height: 18,
            width: 45,
            child: Text(
              'Gender',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 225,
          ),
          child: SizedBox(
            height: 18,
            width: 79,
            child: Text(
              'Account Age',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
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
              widget.userName,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
              widget.userMail,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
            child: Text(
              widget.phoneNumber,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
            child: Text(
              widget.userAge.toString(),
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
            child: Text(
              widget.userCountry,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 197,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: Text(
              widget.userGneder,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 225,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: Text(
              '${widget.accountAge} Days',
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
