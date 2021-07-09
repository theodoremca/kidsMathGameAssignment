import 'package:flutter/material.dart';


class OptionButtonProvider extends ChangeNotifier {
  bool _tapped = false;
  bool get tapped => _tapped;
  set tapped(bool newValue) {
    _tapped = newValue;
    notifyListeners();
  }
}
