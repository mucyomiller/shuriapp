import 'package:flutter/material.dart';
import 'package:shuriapp/src/widgets/announcement_card.dart';

class AnnouncementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Announcements',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            AnnouncementCard(),
            AnnouncementCard(),
            AnnouncementCard(),
            AnnouncementCard(),
          ],
        ),
      ),
    );
  }
}
