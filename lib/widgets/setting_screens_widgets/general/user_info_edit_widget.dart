import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/setting_screens_widgets/general/user_info_card.dart';
import 'package:wineapp/widgets/setting_screens_widgets/settings_edit_button.dart';

class UserInfoEditWidget extends StatelessWidget {
  const UserInfoEditWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
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
                height: 190,
                width: 320,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: Text(
                  'General',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.left,
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  top: 49,
                ),
                child: SettingsEditButton(
                  onTap: () {
                    SettingsDialogMethod(context, 'Username', 'username',
                        data['username'], TextEditingController());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  top: 83,
                ),
                child: SettingsEditButton(
                  onTap: () {
                    SettingsDialogMethod(
                        context,
                        'E-Mail',
                        'email',
                        FirebaseAuth.instance.currentUser!.email.toString(),
                        TextEditingController());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  top: 117,
                ),
                child: SettingsEditButton(
                  onTap: () {
                    SettingsDialogMethod(context, 'Age', 'age',
                        data['age'].toString(), TextEditingController());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  top: 151,
                ),
                child: SettingsEditButton(
                  onTap: () {
                    SettingsDialogMethod(context, 'Country', 'country',
                        'Germany', TextEditingController());
                  },
                ),
              ),
            ],
          );
        }
        return const Text('Loading...');
      },
    );
  }

  Future<dynamic> SettingsDialogMethod(
    BuildContext context,
    String changeAttribute,
    String firestoreLocation,
    String data,
    TextEditingController textEditingController,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 1,
          backgroundColor: Theme.of(context).indicatorColor,
          insetAnimationCurve: Curves.decelerate,
          child: SizedBox(
            height: 170,
            width: 320,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                  ),
                  child: Text(
                    changeAttribute,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  right: 15,
                  top: 51,
                  child: Container(
                    height: 35,
                    width: 290,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: textEditingController,
                        cursorColor: Theme.of(context).indicatorColor,
                        cursorRadius: const Radius.circular(90),
                        cursorWidth: 2.5,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: data,
                          hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).indicatorColor)),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 111,
                  child: Container(
                    height: 35,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Center(
                      child: Text(
                        'Delete Changes',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 111,
                  child: GestureDetector(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(
                              FirebaseAuth.instance.currentUser!.uid.toString())
                          .set({
                        firestoreLocation: textEditingController.text
                      }, SetOptions(merge: true)).then(
                              (value) => print("Data merged!"));
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 135,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Theme.of(context).indicatorColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
