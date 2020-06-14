import 'package:flutter/material.dart';
import 'package:shuriapp/src/screens/alert_list.dart';
import 'package:shuriapp/src/screens/student_list.dart';

class StudentAlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Student',
                ),
                Tab(text: 'Alert'),
              ],
              indicatorColor: Colors.black,
              labelColor: Colors.white,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: TabBarView(
            children: [
              StudentList(),
              AlertList(),
            ],
          ),
        ),
      ),
    );
  }
}
