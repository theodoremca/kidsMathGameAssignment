import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:unit7_mobile_dev/app/common/score.dart';
import 'package:unit7_mobile_dev/app/providers/game_provider.dart';
import 'package:unit7_mobile_dev/app/services/question_generator.dart';
import 'package:unit7_mobile_dev/app/services/question_model.dart';
import 'package:unit7_mobile_dev/utils.dart';

import 'complete.dart';

class Game extends StatefulWidget {
  const Game(
      {Key key, this.question, this.questionNumber,this.level})
      : super(key: key);
  final QuestionModel question;
  final int questionNumber;

  final int level;
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  CountdownTimerController controller;
  bool canPop = false;

  @override
  void initState() {
    super.initState();

    int duration = widget.level == 1 ? 20 : 10;
    if (widget.level != 0) {
      controller = CountdownTimerController(
          endTime: DateTime.now().millisecondsSinceEpoch + 1000 * duration,
          onEnd:onEnd);
    }
  }


  onEnd() {
    controller.disposeTimer();
    controller.dispose();
    nextQuestion();
  }

  nextQuestion(){
    if(widget.questionNumber.toString() == "10"){
     return Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Complete(
          )));
    }
    dynamic _question =
    QuestionGenerator().randomQuestion();
    int questionNumber = widget.questionNumber + 1;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => Game(
          level: widget.level,
          question: _question,
          questionNumber: questionNumber,
        )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> goBackDialog(
      BuildContext context) {
 return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  text: 'Quit Game ?',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: '',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    // can add more TextSpans here...
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                    child: OutlineButton(
                      color: Unit7Colors.colorBrown,
                        onPressed: () {
                        canPop = false;
                          Navigator.of(context).pop();

                        },
                        child: Text("Cancel",
                            style: TextStyle(
                                color: Unit7Colors.colorBrown,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    height: 30,
                    child: RaisedButton(
                        onPressed: () {
                          canPop = true;
                          Navigator.pop(context);

                        },
                        color: Unit7Colors.colorBrown,
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: Unit7Colors.colorWhite, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    print(widget.question.question);
    print(widget.question.firstValue +
        " ${widget.question.operation} " +
        widget.question.secondValue);
    print(widget.question.options);


    return WillPopScope(
    onWillPop: () async {
      await goBackDialog(context);
      return canPop;
    },
      child: ChangeNotifierProvider<GameController>(
        create: (_) => GameController(),
        child: Scaffold(
          body: Center(
              child:
                  // Figma Flutter Generator Group1840Widget - GROUP
                  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Text(
                  'Score : ${score * 10}%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(3, 221, 238, 1),
                      fontFamily: 'Unit7 Secondary',
                      fontSize: 20,
                      letterSpacing: 0,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                  ),
                ),

              Text(
                'Question ${widget.questionNumber}',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CharacterWidget(character: widget.question.firstValue),
                      CharacterWidget(character: widget.question.operation),
                      CharacterWidget(character: widget.question.secondValue),
                    ],
                  ),
                  SizedBox(width: 10),
                  SizedBox(height: 10),
                  OptionButton(
                      onTap: widget.level != 0 ? onEnd : nextQuestion,

                      option: widget.question.options[0],
                      answer: widget.question.answer),
                  OptionButton(
                      onTap: widget.level != 0 ? onEnd : nextQuestion,

                      option: widget.question.options[1],
                      answer: widget.question.answer),
                  OptionButton(
                      onTap: widget.level != 0 ? onEnd :nextQuestion,
                      option: widget.question.options[2],
                      answer: widget.question.answer),
                ],
              ),
              widget.level != 0 ? CountdownTimer(
                controller: controller,
                widgetBuilder: (_, CurrentRemainingTime time) {
                  if (time == null) {
                    return Container();
                  }
                  return Text(
                    time.sec.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(240, 115, 1, 1),
                        fontFamily: 'Unit7 Digital',
                        fontSize: 70,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal),
                  );
                },
              ): Container()
            ],
          )),
          // floatingActionButton: FloatingActionButton(
          //   child: Counter(),
          //   onPressed: () {
          //     onEnd();
          //     controller.disposeTimer();
          //   },
          // ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({Key key, this.option, this.answer, this.onTap})
      : super(key: key);
  final option;
  final answer;
  final VoidCallback onTap;

   correct() {
    onTap();
    print(" it is === ${option.toString() == answer.toString()}");
    if(option.toString() == answer.toString()){
      score++;
    }

    return option.toString() == answer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: correct,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            width: 164,
            height: 86,
            child: Consumer<GameController>(
              builder: (context, pressed, child) {
                return Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 164,
                          height: 86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(37),
                              topRight: Radius.circular(37),
                              bottomLeft: Radius.circular(37),
                              bottomRight: Radius.circular(37),
                            ),
                            color: Color.fromRGBO(122, 1, 0, 1),
                            border: Border.all(
                              color: Color.fromRGBO(240, 115, 1, 1),
                              width: 7,
                            ),
                          ))),
                  Positioned(
                      top: 14,
                      left: 62,
                      child: Text(
                        option.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(240, 115, 1, 1),
                            fontFamily: 'Unit7 Secondary',
                            fontSize: 43,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      )),

                ]);
              },
            )),
      ),
    );
  }
}

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    Key key,
    @required this.character,
  }) : super(key: key);
  final String character;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: character == "/"
                  ? AssetImage('assets/numbers/divide.png')
                  : AssetImage('assets/numbers/$character.png'),
              fit: BoxFit.scaleDown),
        ));
  }
}
