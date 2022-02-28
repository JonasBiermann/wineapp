import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/screens/home/main_screen.dart';

class SettingBottomNavigationBar extends StatelessWidget {
  const SettingBottomNavigationBar({
    Key? key,
    required this.data,
    required this.dataLabel,
  }) : super(key: key);

  final List<IconData> data;
  final List<String> dataLabel;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        height: 88,
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          pageIndex: 0,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 22,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      data[0],
                      size: 17,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          pageIndex: 1,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 22,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      data[1],
                      size: 17,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          pageIndex: 2,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 22,
                    width: 46,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(90)),
                    child: Icon(
                      data[2],
                      size: 17,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 14,
                    width: 40,
                    child: Text(
                      dataLabel[0],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                    width: 40,
                    child: Text(
                      dataLabel[1],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                    width: 40,
                    child: Text(
                      dataLabel[2],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
