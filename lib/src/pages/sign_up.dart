import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuriapp/src/pages/code_verification.dart';
import 'package:shuriapp/src/services/authentication_service.dart';

class SignUp extends StatefulWidget {
  final SharedPreferences prefs;
  SignUp({this.prefs});

  static const String routeName = '/sign-up';

  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formState = new GlobalKey<FormState>();
  TextEditingController _phoneTextEditController = new TextEditingController();
  String phoneCode = "250";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: false,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/images/white_logo.png',
                          width: MediaQuery.of(context).size.width * 0.50,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 35.0),
                        child: Form(
                          key: _formState,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Get started,",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                "Sign In to continue",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 1.0,
                                  right: 1.0,
                                  top: 20.0,
                                ),
                                child: Text(
                                  "Phone Number",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Card(
                                elevation: 0.0,
                                margin: EdgeInsets.only(top: 10.0),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black.withOpacity(0.15),
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      CountryCodePicker(
                                        onChanged: print,
                                        initialSelection: 'RW',
                                        // optional. Shows only country name and flag
                                        showFlagDialog: true,
                                        // optional. Shows only country name and flag when popup is closed.
                                        showOnlyCountryWhenClosed: false,
                                        // optional. aligns the flag and the Text left
                                        alignLeft: false,
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: TextFormField(
                                            controller:
                                                _phoneTextEditController,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textInputAction:
                                                TextInputAction.done,
                                            validator: (v) => v.isEmpty
                                                ? 'Phone number is required'
                                                : null,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          style: BorderStyle
                                                              .none)),
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      style: BorderStyle.none)),
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          style: BorderStyle
                                                              .none)),
                                              errorBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      style: BorderStyle.none)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          style: BorderStyle
                                                              .none)),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          style: BorderStyle
                                                              .none)),
                                            ),
                                            inputFormatters: [
                                              new BlacklistingTextInputFormatter(
                                                new RegExp('[\\.|\\,|\\-|\\ ]'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    color: Color(0xFFF5CA19),
                                    onPressed: () {
                                      if (!isLoading) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        _sendVerificationCode(context);
                                      }
                                    },
                                    child: !isLoading
                                        ? Text(
                                            'Next',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _sendVerificationCode(BuildContext context) async {
    var code = phoneCode;
    //TODO: remember to remove hardcoded 250 phone code
    var tel = _phoneTextEditController.text;
    if (code != null && tel != null && tel != "") {
      var _tel = "$code${int.parse(tel)}";
      var rsp = await driverVerifyNumber(_tel);
      // check if request was accepted by server!
      // TODO: remove code after implementing SMS gateway
      if (rsp['status'] == 200) {
        // flip next btn loading state
        setState(() {
          isLoading = false;
        });
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CodeVerification(phoneNumber: _tel, prefs: widget.prefs),
          ),
        );
      } else {
        // flip next btn loading state
        setState(() {
          isLoading = false;
        });
        if (kDebugMode)
          print('error happened here is the srv rsp -> ${rsp.toString()}');
        if (rsp['message'] != null) {
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              backgroundColor: Colors.redAccent.shade200,
              duration: Duration(seconds: 3),
              content: Text(rsp['message']),
            ),
          );
        } else {
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              backgroundColor: Colors.redAccent.shade200,
              duration: Duration(seconds: 3),
              content: Text("Oops! something unexpected happened!"),
            ),
          );
        }
      }
      // retry if failed!
    } else {
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          backgroundColor: Colors.redAccent.shade200,
          duration: Duration(seconds: 3),
          content: Text(
            'Please provide phone code and telephone number!',
          ),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }
}
