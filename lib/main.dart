import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/home/main_screen.dart';
import 'package:wineapp/screens/introduction_screens/introduction_screen_1.dart';
import 'package:wineapp/services/auth_services.dart';

void main() async {
  await ThemeManager.initialise();
  await Firebase.initializeApp();
  runApp(const WineApp());
}

class WineApp extends StatelessWidget {
  const WineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Wine App',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        home: StreamBuilder(
          stream: AuthService().firebaseAuth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainScreen(pageIndex: 0);
            }
            return const IntroductionScreen1();
          },
        ),
      ),
    );
  }
}
