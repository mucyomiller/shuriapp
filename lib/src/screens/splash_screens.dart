import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         backgroundColor: Color(0xFF7B68EE),
         body:Container(
           child:Column(
             children:[
               Container(margin: EdgeInsets.symmetric(vertical: 160.0),
                         padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Image.asset(
                            'assets/on_time2.png',
                            width: MediaQuery.of(context).size.width * 0.50,
                          ),
                        ),
                      ),               
             ]
           )
           
         )
       ),
    );
  }
}