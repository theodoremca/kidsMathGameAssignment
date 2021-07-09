import 'package:flutter/material.dart';

class Unit7Colors {
  // This class is not meant to be instantiated or extended; this constructor

  static const Color colorWhite = Color(0xfffff6e5);
  static const Color colorBrown = Color.fromRGBO(122, 1, 0, 1);
  static const Color colorBlue = Color.fromRGBO(3, 221, 238, 1);
  static const Color colorYellow = Color.fromRGBO(255, 223, 0, 1);
}

class Responsive {
  static const double figmaWidth = 411;
  static const double figmaHieght = 823;
  int width(double mediaWidth, double realwidth) {
    return (mediaWidth * realwidth) ~/ figmaWidth;
  }
}
