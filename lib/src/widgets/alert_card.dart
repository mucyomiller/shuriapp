import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
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
                    ),
                    Text(
                      '2018-02-23 07:13:19',
                      style: TextStyle(color: Colors.black54),
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
                  'MEETTING 2018',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Hey my Name is MUHOZA yves  New HeadMaster of Green Hills',
                  style: TextStyle(color: Colors.black54),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
