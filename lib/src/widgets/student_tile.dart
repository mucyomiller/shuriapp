import 'package:flutter/material.dart';
import 'package:shuriapp/src/models/bus_stops.dart';
import 'package:shuriapp/src/widgets/status_indicator.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  StudentTile({this.student});
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/default_avatar.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Names:',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(child: Text('Munyantebe Hertier')),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'School:',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(child: Text('Excella School')),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Level:',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(child: Text('P6')),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Bus plate:',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(child: Text('RAA 234P')),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  StatusIndicator(status: Status.atschool, title: 'At school')
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
