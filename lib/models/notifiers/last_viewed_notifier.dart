import 'package:flutter/material.dart';

class LastViewedNotifier with ChangeNotifier {
  int id = 0;

  int getId() => id;
  void setId(int id) {
    this.id = id;
    notifyListeners();
  }
}