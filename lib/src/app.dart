import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuriapp/src/pages/home_page.dart';
import 'package:shuriapp/src/pages/onboarding_page.dart';
import 'package:shuriapp/src/pages/sign_up.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  final SharedPreferences prefs;

  App({this.prefs});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    // cache image
    precacheImage(AssetImage("assets/white_logo.webp"), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shuriapp',
      theme: ThemeData(
        primaryColor: Color(0xFFFAB72A),
      ),
      home: _handleCurrentScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    bool loggedIn = (prefs.getBool('loggedIn') ?? false);
    if (seen) {
      if (loggedIn) {
        return HomePage();
      }
      return SignUp(prefs: prefs);
    }
    return OnBoardingPage(prefs: prefs);
  }
}
