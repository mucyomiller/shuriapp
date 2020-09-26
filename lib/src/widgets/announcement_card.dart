import 'package:flutter/material.dart';
import 'package:shuriapp/src/widgets/routes.dart';

class AnnouncementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('assets/default_avatar.png'),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Horizon Primary School',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Topic',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  child: Text(
                    'How do parents contribute to the development of school',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/moredetails',
                        arguments:
                            'How do parents contribute to the development of school');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
