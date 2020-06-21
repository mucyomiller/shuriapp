import 'package:flutter/foundation.dart';

class CurrentStudent extends ChangeNotifier {
  String studentId;

  String get currentStudent => this.studentId;

  set switchStudent(String value) {
    if (this.studentId != value) {
      this.studentId = value;
      notifyListeners();
    }
  }
}
