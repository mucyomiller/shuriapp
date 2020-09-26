import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuriapp/src/pages/sign_up.dart';
import 'package:shuriapp/src/pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  final SharedPreferences prefs;
  OnBoardingPage({this.prefs});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    widget.prefs.setBool('seen', true); //set seen -> true
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SignUp(prefs: widget.prefs),
      ),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Shuri app",
          body:
              "Instead of waiting know when bus is coming to pick you, before time.",
          image: _buildImage('vanpool'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reminder",
          body: "Get instant notification about your journey.",
          image: _buildImage('mobile'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Students or Parent",
          body:
              "Student or Parent can track bus  and get notification from schools.",
          image: _buildImage('coins'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get Started",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click Done and Start!", style: bodyStyle),
            ],
          ),
          image: _buildImage('vanpool'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFF7B68EE),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
