import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/home_screens_widgets/add_meal_button.dart';
import 'package:wineapp/widgets/home_screens_widgets/home_screen_header.dart';
import 'package:wineapp/widgets/home_screens_widgets/latest_meal_card_widget.dart';
import 'package:wineapp/widgets/home_screens_widgets/somellier_activity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tasteIndex = 2;
  List<String> icondata = [
    'assets/icons/sad.svg',
    'assets/icons/smile.svg',
    'assets/icons/grin-stars.svg',
  ];
  List<String> labeldata = [
    'Not really...',
    'Yes it did!',
    'Perfectly!',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 750,
              color: backgroundColor,
            ),
            HomeScreenHeader(
                subText: 'Welcome Back', mainText: 'Aurelie', boxWidth: 161),
            const LatestMealCard(),
            const SomellierActivity(),
            const AddMealButton(),
          ],
        ),
      ),
    );
  }
}
