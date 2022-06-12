import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future:
          users.doc(FirebaseAuth.instance.currentUser!.uid.toString()).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text('Document does not exist');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Stack(
            children: [
              Container(
                height: 217,
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
              const UserInfoTitle(
                left: 15,
                top: 52,
                text: 'Username',
              ),
              const UserInfoTitle(
                left: 15,
                top: 85,
                text: 'Email',
              ),
              const UserInfoTitle(
                left: 15,
                top: 118,
                text: 'Age',
              ),
              const UserInfoTitle(
                left: 15,
                top: 151,
                text: 'Country',
              ),
              const UserInfoTitle(
                left: 15,
                top: 184,
                text: 'Account Age',
              ),
              UserInfoContent(
                data: data['username'],
                left: 155,
                top: 52,
                height: 18,
                width: 150,
              ),
              UserInfoContent(
                data: FirebaseAuth.instance.currentUser!.email.toString(),
                left: 90,
                top: 85,
                height: 18,
                width: 215,
              ),
              UserInfoContent(
                data: data['age'].toString(),
                left: 155,
                top: 118,
                height: 18,
                width: 150,
              ),
              const UserInfoContent(
                data: 'Germany',
                left: 155,
                top: 151,
                height: 18,
                width: 150,
              ),
              UserInfoContent(
                data:
                    '${(DateTime.now().difference(data['dateAdded'].toDate()).inHours / 24).round()} Days',
                left: 155,
                top: 184,
                height: 18,
                width: 150,
              ),
            ],
          );
        }
        return const Text('Loading...');
      },
    );
  }
}

class UserInfoContent extends StatelessWidget {
  const UserInfoContent({
    Key? key,
    required this.data,
    required this.left,
    required this.top,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String data;
  final double left;
  final double top;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Text(
          data,
          overflow: TextOverflow.ellipsis,
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
    );
  }
}

class UserInfoTitle extends StatelessWidget {
  const UserInfoTitle(
      {Key? key, required this.left, required this.top, required this.text})
      : super(key: key);

  final double left;
  final double top;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
      ),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Theme.of(context).indicatorColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
