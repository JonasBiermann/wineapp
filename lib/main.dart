import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:wineapp/screens/home/main_screen.dart';
import 'package:wineapp/screens/introduction_screens/introduction_screen_1.dart';
import 'package:wineapp/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WineApp());
}

class WineApp extends StatelessWidget {
  WineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(brightness: brightness),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
            title: 'Wine App',
            home: StreamBuilder(
              stream: AuthService().firebaseAuth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MainScreen(pageIndex: 0);
                }
                return const IntroductionScreen1();
              },
            ));
      },
    );
  }
}
