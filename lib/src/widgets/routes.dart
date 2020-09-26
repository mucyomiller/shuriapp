import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shuriapp/src/widgets/moredetails.dart';

class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      //  case '/':
      //  return MaterialPageRoute(builder: (_)=>Welcome());
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
