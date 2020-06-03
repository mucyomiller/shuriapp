import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuriapp/src/pages/home_page.dart';
import 'package:shuriapp/src/pages/sign_up.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  final SharedPreferences prefs;

  App({this.prefs});

  @override
  Widget build(BuildContext context) {
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
    bool loggedIn = (prefs.getBool('loggedIn') ?? false);
    if (loggedIn) {
      return HomePage();
    }
    return SignUp(prefs: prefs);
  }
}
