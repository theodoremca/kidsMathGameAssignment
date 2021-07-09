import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit7_mobile_dev/app/common/level_button.dart';
import 'package:unit7_mobile_dev/app/providers/level_provider.dart';
import 'package:unit7_mobile_dev/landing_page.dart';

import 'common/score.dart';

class Complete extends StatelessWidget {
@override
Widget build(BuildContext context) {
  void toHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => LandingPage()));
  }
  return ChangeNotifierProvider<Level>(
      create: (_) => Level(),
      child: Material(
        child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 246, 229, 1),
            ),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Container(
                      width: MediaQuery.of(context).size.width *0.7,
                      height: MediaQuery.of(context).size.width *0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/complete_star.png"),
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    // Figma Flutter Generator Rectangle92Widget - RECTANGLE
                    Container(
                        width:MediaQuery.of(context).size.width *0.7,
                        height: MediaQuery.of(context).size.width *0.35,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(47),
                            topRight: Radius.circular(47),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          color : Color.fromRGBO(122, 1, 0, 1),
                          border : Border.all(
                            color: Color.fromRGBO(240, 115, 1, 1),
                            width: 7,
                          ),
                        ),
                      child: Center(
                        child: Text(
                          "${score * 10}%",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(240, 115, 1, 1),
                              fontFamily: 'Unit7 Secondary',
                              fontSize: MediaQuery.of(context).size.height * 0.1,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,

                          ),
                        ),
                      ),

                    ),
                    GestureDetector(
                      onTap: toHome,
                      child: Container(
                          width:MediaQuery.of(context).size.width *0.6,
                          height: MediaQuery.of(context).size.width *0.3,
                          decoration: BoxDecoration(
                              image : DecorationImage(
                                  image: AssetImage('assets/go_back.png'),
                                  fit: BoxFit.scaleDown
                              ))),
                    )



                  ],
                ),
              ),
            )),
      ));
}


}