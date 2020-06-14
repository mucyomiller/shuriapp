import 'package:flutter/material.dart';
import 'package:shuriapp/src/screens/settings_screen.dart';

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
  const Choice(title: 'Setting', icon: Icons.settings),
];

class _ProfileScreenState extends State<ProfileScreen> {
  void _select(Choice choice) {
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {}),
        body: Column(
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
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 1.0, color: Colors.black)
                        ])),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              'John Doe',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            SizedBox(height: 15.0),
            ListView(
              shrinkWrap: true,
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: Icon(Icons.phone_in_talk,
                        color: Theme.of(context).primaryColor),
                    title: Text(
                      '+250784680568',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    subtitle: Text('Tel. Number'),
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
                    title: Text('Rindiro Bruce'),
                    subtitle: Text('Location'),
                  ),
                ],
              ).toList(),
            )
          ],
        ));
  }
}
