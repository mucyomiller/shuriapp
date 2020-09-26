import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuriapp/src/pages/home_page.dart';
import 'package:shuriapp/src/services/authentication_service.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeVerification extends StatefulWidget {
  final SharedPreferences prefs;

  final String phoneNumber;

  const CodeVerification(
      {Key key, @required this.phoneNumber, @required this.prefs})
      : assert(phoneNumber != null, prefs != null);

  _CodeVerificationState createState() => new _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _codeTextEditingController =
      new TextEditingController();
  String phoneNumber;
  bool isLoading = false; // btn loading
  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    // _showBottomContainer();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top * 2.0),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Image.asset(
                    'assets/on_time.png',
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.10,
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      text: TextSpan(
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'ShuriBus just sent a text\nmessage with verification code\nto'),
                            TextSpan(
                                text: '  $phoneNumber',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: _codeTextEditingController,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Enter Code",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 15.0),
                    ),
                    onSubmitted: (v) {
                      _validateOTPcode(context);
                    },
                    inputFormatters: [
                      new BlacklistingTextInputFormatter(
                        new RegExp("[\\,|\\.|\\-|\\ ]"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.0),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      color: Color(0xFF7B68EE),
                      onPressed: () {
                        if (!isLoading) {
                          setState(() {
                            isLoading = true;
                          });
                          _validateOTPcode(context);
                        }
                      },
                      child: !isLoading
                          ? Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            )
                          : SpinKitThreeBounce(
                              color: Colors.white,
                              size: 15.0,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showBottomContainer() {
    if (_scaffoldKey.currentState != null &&
        _scaffoldKey.currentState.mounted) {
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: Text("Didn\'t get the code"),
          action: SnackBarAction(
            textColor: Colors.yellowAccent,
            label: 'RESEND IT',
            onPressed: () {
              //TODO: implement resend OTP code logic
            },
          ),
          duration: Duration(minutes: 60),
        ),
      );
    }
  }

  _validateOTPcode(BuildContext context) async {
    var _code = _codeTextEditingController.text;
    if (_code.isNotEmpty) {
      // validate OTP code
      var rsp = await studentValidateOTP(widget.phoneNumber, _code);
      // reset btn loading state
      setState(() {
        isLoading = false;
      });

      if (rsp['status'] == 200 && rsp['token'] != null) {
        // set logged in to true
        widget.prefs.setBool('loggedIn', true);
        // save token
        widget.prefs.setString('jwt_token', rsp['token']);
        SharedPreferences kubika = await SharedPreferences.getInstance();
        kubika.setString('token', rsp['token']);
        kubika.setBool('loggedIn', true);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          ModalRoute.withName("/homepage"),
        );
      } else {
        if (kDebugMode) print('error happened -> ${rsp.toString()}');
        if (rsp['error'] != null) {
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text(
                rsp['error'],
                style: TextStyle(color: Colors.red),
              ),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text(
                'Oops! something unexpected happened!',
                style: TextStyle(color: Colors.red),
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: Text('Please enter code'),
        backgroundColor: Colors.redAccent.shade200,
        duration: Duration(seconds: 8),
      ));
      setState(() {
        isLoading = false;
      });
    }
  }
}
