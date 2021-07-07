import 'package:flutter/material.dart';

class Unit7Colors {
  // This class is not meant to be instantiated or extended; this constructor

  static const Color color1 = Color(0xfffff6e5);
}

class Responsive {
  static const double figmaWidth = 411;
  static const double figmaHieght = 823;
  int width(double mediaWidth, double realwidth) {
    return (mediaWidth * realwidth) ~/ figmaWidth;
  }
}
