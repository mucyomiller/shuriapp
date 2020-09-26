import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuriapp/src/pages/sign_up.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  Choice(title: 'Setting', icon: Icons.settings),
  Choice(title: 'Payment', icon: Icons.payment),
];

class _ProfileScreenState extends State<ProfileScreen> {
  void _select(Choice choice) {
    if (choice.title == 'Setting') {
      Navigator.pushNamed(context, '/settings');
    } else {
      Navigator.pushNamed(context, '/payment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7B68EE),
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: Color(0xFF7B68EE),
        //     child: Icon(
        //       Icons.edit,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {}),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/default_avatar.png"),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 1.0, color: Colors.black)
                            ])),
                  ),
                ),
                SizedBox(height: 15.0),
                Text('John Doe',
                    style: GoogleFonts.fredokaOne(
                        textStyle: TextStyle(fontSize: 30.0))),
                SizedBox(height: 15.0),
                ListView(
                  shrinkWrap: true,
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        leading: Icon(MaterialCommunityIcons.school,
                            color: Theme.of(context).primaryColor),
                        title: Text('School name',
                            style: GoogleFonts.fredokaOne(
                                textStyle: TextStyle(fontSize: 20.0))),
                        subtitle: Text('Kagarama high school'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone_in_talk,
                            color: Theme.of(context).primaryColor),
                        title: Text(
                          '+250784680568',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        subtitle: Text('Parent Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email,
                            color: Theme.of(context).primaryColor),
                        title: Text('rindirobruce@gmail.com'),
                        subtitle: Text('Email'),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on,
                            color: Theme.of(context).primaryColor),
                        title: Text('Bus stop'),
                        subtitle: Text('ALU business school, Kigali, Rwanda'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(
                                MaterialCommunityIcons.logout,
                                color: Color(0xFF7B68EE),
                              ),
                              Text(
                                'Logout',
                                style: GoogleFonts.fredokaOne(
                                    textStyle: TextStyle(fontSize: 14.0)),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignUp()),
                          );
                        },
                      )
                    ],
                  ).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
