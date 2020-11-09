import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuriapp/src/pages/home_page.dart';
import 'package:shuriapp/src/pages/onboarding_page.dart';
import 'package:shuriapp/src/pages/payment_page.dart';
import 'package:shuriapp/src/pages/sign_up.dart';
import 'package:shuriapp/src/rx/current_student.dart';
import 'package:shuriapp/src/screens/home_screen.dart';
import 'package:shuriapp/src/screens/settings_screen.dart';
import 'package:shuriapp/src/widgets/moredetails.dart';
import 'package:shuriapp/src/widgets/routes.dart';
import 'package:shuriapp/src/screens/splash_screens.dart';
import 'dart:async';

class App extends StatefulWidget {
  // This widget is the root of your application.
  final SharedPreferences prefs;

  App({this.prefs});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 9000), () {
      setState(() {
        isLoading = false;
      });


    });
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    // cache image
    precacheImage(AssetImage("assets/white_logo.webp"), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentStudent>.value(value: CurrentStudent())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shuriapp',
        theme: ThemeData(
            primaryColor: Color(0xFF7B68EE), accentColor: Colors.orangeAccent),
        home: _handleCurrentScreen(),
        // routes: <String, WidgetBuilder>{
        //   '/home': (BuildContext context) => HomePage(),
        //   '/settings': (BuildContext context) => SettingsScreen(),
        //   '/payment': (BuildContext context) => PaymentPage(),
        //   '/homescreen': (BuildContext context) => HomeScreen(),
        //   '/moredetails': (BuildContext context) => Moredetails(),
        // },
        onGenerateRoute: Routegenerator.generateRoute,
      ),
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (widget.prefs.getBool('seen') ?? false);
    bool loggedIn = (widget.prefs.getBool('loggedIn') ?? false);
    if (seen) {
      if (loggedIn) {
        if (isLoading) {
          return SplashScreen();
        } else {
          return HomePage();
        }
      }

      if (isLoading) {
        return SplashScreen();
      } else {
        return SignUp(prefs: widget.prefs);
      }
    }
    return OnBoardingPage(prefs: widget.prefs);
  }
}
