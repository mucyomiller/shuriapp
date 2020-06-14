import 'package:flutter/material.dart';
import 'package:shuriapp/src/models/bus_stops.dart';

class AlertTile extends StatelessWidget {
  final Student student;
  AlertTile({this.student});
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.notifications_active,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                'Your bus just ready to return back home with Ngabo Eric',
              ),
            ),
            Text(
              '4 months ago',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
