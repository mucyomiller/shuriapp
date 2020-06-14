import 'package:flutter/material.dart';
import 'package:shuriapp/src/models/bus_stops.dart' as bs;
import 'package:shuriapp/src/widgets/student_tile.dart';

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('clicked student tile! index-> $index');
              },
              child: StudentTile(
                student: bs.Student(
                    firstName: "John", lastName: "Doe", gender: "male"),
              ),
            );
          }),
    );
  }
}
