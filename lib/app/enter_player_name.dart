import 'package:flutter/material.dart';
import 'package:unit7_mobile_dev/app/common/name_text_field.dart';

class PlayerName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 246, 229, 1),
          ),
          child: Stack(children: <Widget>[
            Center(
              child: Container(
                  width: 189,
                  height: 348,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/player_name_boy.png'),
                        fit: BoxFit.fitWidth),
                  )),
            ),
            Center(
                child: Container(
                    width: 317,
                    height: 158,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: Color.fromRGBO(240, 115, 1, 1),
                      border: Border.all(
                        color: Color.fromRGBO(122, 1, 0, 1),
                        width: 6,
                      ),
                    ))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'What your name ?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 252, 232, 1),
                        fontFamily: 'Unit7 Primary',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                  ),
                  NameTextField(),
                ],
              ),
            ),
          ])),
    );
  }
}
