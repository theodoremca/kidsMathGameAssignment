import 'dart:ffi';

import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  StartButton({this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StartButton - GROUP
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 283,
          height: 95,
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 283,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      color: Color.fromRGBO(240, 115, 1, 1),
                      border: Border.all(
                        color: Color.fromRGBO(122, 1, 0, 1),
                        width: 5,
                      ),
                    ))),
            Center(
                child: Text(
                  'Start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(122, 1, 0, 1),
                      fontFamily: 'Unit7 Secondary',
                      fontSize: 53,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                      ),
                )),
          ])),
    );
  }
}
