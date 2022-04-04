import 'package:flutter/material.dart';
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
    'assets/icons/general/sad.svg',
    'assets/icons/general/smile.svg',
    'assets/icons/general/grin-stars.svg',
  ];
  List<String> labeldata = [
    'Not really...',
    'Yes it did!',
    'Perfectly!',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 750,
              color: Theme.of(context).scaffoldBackgroundColor,
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
