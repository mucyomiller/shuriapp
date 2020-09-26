import 'package:flutter/material.dart';
import 'package:shuriapp/src/widgets/announcement_card.dart';
import 'package:shuriapp/src/widgets/alert_card.dart';

class AlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            AlertCard(),
            AlertCard(),
            AlertCard(),
            AlertCard(),
          ],
        ),
      ),
    );
  }
}
