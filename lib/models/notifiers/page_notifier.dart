import 'package:flutter/material.dart';

class PageNotifier with ChangeNotifier {
  void changePsalterFontSize() {
    notifyListeners();
  }
}