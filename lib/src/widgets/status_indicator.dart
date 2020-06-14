import 'package:flutter/material.dart';

enum Status { offbus, onbus, atschool }

class StatusIndicator extends StatelessWidget {
  final Status status;
  final String title;
  StatusIndicator({@required this.status, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 12,
          height: 12,
          decoration:
              BoxDecoration(color: getColor(status), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: getColor(status),
          ),
        )
      ],
    );
  }

  Color getColor(Status status) {
    switch (status) {
      case Status.offbus:
      case Status.onbus:
        return Colors.yellow;
      case Status.atschool:
        return Colors.green;
      default:
        return Colors.yellow;
    }
  }
}
