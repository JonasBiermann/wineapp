import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/screens/home/home_screen.dart';
import 'package:wineapp/screens/home/search_screen.dart';
import 'package:wineapp/screens/home/settings_screen.dart';
import 'package:wineapp/models/custom_icons_icons.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.pageIndex}) : super(key: key);
  int pageIndex;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];
  List<IconData> data = [
    CustomIcons.home,
    CustomIcons.search,
    CustomIcons.user,
  ];
  List<String> dataLabel = [
    'Home',
    'Search',
    'Account',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageList[widget.pageIndex],
        ],
      ),
      // bottomNavigationBar: NavigationBarTheme(
      //   data: NavigationBarThemeData(
      //       indicatorColor: Theme.of(context).indicatorColor.withOpacity(0.5)),
      //   child: NavigationBar(
      //     height: 90,
      //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //     selectedIndex: widget.pageIndex,
      //     animationDuration: const Duration(seconds: 1),
      //     onDestinationSelected: (int newIndex) {
      //       setState(() {
      //         widget.pageIndex = newIndex;
      //       });
      //     },
      //     destinations: const [
      //       NavigationDestination(
      //           selectedIcon: Icon(
      //             Icons.home,
      //             color: Colors.white,
      //           ),
      //           icon: Icon(
      //             Icons.home_outlined,
      //             color: Colors.white,
      //           ),
      //           label: 'Home'),
      //       NavigationDestination(
      //           selectedIcon: Icon(Icons.search, color: Colors.white),
      //           icon: Icon(Icons.search_outlined, color: Colors.white),
      //           label: 'Search'),
      //       NavigationDestination(
      //           selectedIcon: Icon(Icons.settings, color: Colors.white),
      //           icon: Icon(Icons.settings_outlined, color: Colors.white),
      //           label: 'Settings'),
      //     ],
      //   ),

      bottomNavigationBar: Material(
        borderRadius: BorderRadius.circular(0),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SizedBox(
          height: 90,
          width: 390,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            itemBuilder: (context, value) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.pageIndex = value;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 34, bottom: 5),
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        width: 46,
                        height: 22,
                        decoration: value == widget.pageIndex
                            ? BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(90),
                              )
                            : BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(90)),
                        child: Icon(
                          data[value],
                          size: 17,
                          color: value == widget.pageIndex
                              ? Theme.of(context).indicatorColor
                              : Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          dataLabel[value],
                          style: value == widget.pageIndex
                              ? GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).indicatorColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
