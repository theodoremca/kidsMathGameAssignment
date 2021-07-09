import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class Counter extends StatefulWidget {
  const Counter({Key key, this.endTime}) : super(key: key);
  final int endTime;
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {



  CountdownTimerController controller;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: widget.endTime , onEnd:()=> onEnd);
  }

  onEnd(){
      controller.dispose();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return
      CountdownTimer(
        controller: controller,
        onEnd: onEnd,
        endTime: widget.endTime,
        widgetBuilder: ( _ , CurrentRemainingTime time){
          if (time == null) {
            return Container();
          }
        return  Text(time.sec.toString(), textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(240, 115, 1, 1),
                              fontFamily: 'Unit7 Digital',
                              fontSize: 70,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal
                          ),);


        },
      );

      // Scaffold(
      // backgroundColor: Color.fromRGBO(122, 1, 0, 1),
      // body: Center(
      //   child:
      //   CountdownTimer(
      //     controller: controller,
      //     onEnd: onEnd,
      //     endTime: endTime,
      //   ),
      // ),
    //   floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.stop),
    //     onPressed: () {
    //       onEnd();
    //       controller.disposeTimer();
    //     },
    //   ),
    // );;
  }
}
