import 'package:flutter/material.dart';


class Level extends ChangeNotifier {
  int _level = 0;
  int get level => _level;
  set level(int newValue) {
    _level = newValue;
    notifyListeners();
  }
}
