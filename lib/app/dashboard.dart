import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit7_mobile_dev/app/common/start_button.dart';
import 'package:unit7_mobile_dev/app/providers/level_provider.dart';

import 'common/level_button.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Dashboard - FRAME
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
                      // Figma Flutter Generator ChooselevelWidget - TEXT
                      Text(
                        'Choose level',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(3, 221, 238, 1),
                            fontFamily: 'Unit7 Secondary',
                            fontSize: 46,
                            letterSpacing: 0,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      ),
                      Consumer<Level>(
                        builder: (context, levelIs, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LevelButton(
                                onTap:()=> levelIs.level = 1,
                                id: "level_1",
                                selectedId: "level_${levelIs.level}",
                                innerImage: "level_1.png",
                              ),
                              LevelButton(
                                 onTap:()=> levelIs.level = 2,
                                id: "level_2",
                                selectedId: "level_${levelIs.level}",
                                innerImage: "level_2.png",
                              ),
                              LevelButton(
                                 onTap:()=> levelIs.level = 3,
                                id: "level_3",
                                selectedId: "level_${levelIs.level}",
                                innerImage: "level_3.png",
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StartButton()
                    ],
                  ),
                ),
              )),
        ));
  }
}
