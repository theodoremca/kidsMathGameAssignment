import 'package:flutter/material.dart';


class GameController extends ChangeNotifier {
  int _score = 0;
  int get score  => _score;
  set score(int newValue) {
    _score = newValue;
    notifyListeners();
  }

  bool _tapped = false;
  bool get tapped => _tapped;
  set tapped(bool newValue) {
    _tapped = newValue;
    notifyListeners();
  }

  bool _show = true;
  bool get show => _show;
  set show(bool newValue) {
    _show = newValue;
    notifyListeners();
  }
}
