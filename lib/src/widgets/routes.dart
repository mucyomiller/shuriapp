import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shuriapp/src/widgets/moredetails.dart';
import 'package:shuriapp/src/pages/home_page.dart';
import 'package:shuriapp/src/pages/onboarding_page.dart';
import 'package:shuriapp/src/pages/payment_page.dart';
import 'package:shuriapp/src/pages/sign_up.dart';
import 'package:shuriapp/src/rx/current_student.dart';
import 'package:shuriapp/src/screens/home_screen.dart';
import 'package:shuriapp/src/screens/settings_screen.dart';



class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      //  case '/':
      //  return MaterialPageRoute(builder: (_)=>Welcome());
      case '/home': 
      return MaterialPageRoute(builder: (_)=>HomePage());
      case '/settings':
      return MaterialPageRoute(builder: (_)=>SettingsScreen());
      case '/payment':
      return MaterialPageRoute(builder: (_)=>PaymentPage());
      case '/homescreen':
      return MaterialPageRoute(builder: (_)=>HomeScreen());

      case '/moredetails':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Moredetails(data: args));
        } else {
          return MaterialPageRoute(builder: (_) => Moredetails(data: args));
        }

        return null;
      default:
        return null;
    }
  }
}
