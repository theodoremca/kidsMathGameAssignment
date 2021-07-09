
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit7_mobile_dev/app/common/score.dart';
import 'package:unit7_mobile_dev/app/common/start_button.dart';
import 'package:unit7_mobile_dev/app/game.dart';
import 'package:unit7_mobile_dev/app/providers/level_provider.dart';
import 'package:unit7_mobile_dev/app/services/question_generator.dart';

import 'common/level_button.dart';

class Dashboard extends StatefulWidget {
  // AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
//...

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AudioPlayer audioPlayer = AudioPlayer();

  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;

  AudioCache audioCache;

  String filePath = 'option_tap.wav';

  playLocal() async {
      await audioCache.play(filePath);
    // int result = await audioPlayer.play('audios/themesound.mp3', isLocal: true);
  }
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
    playLocal();
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

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
                                onTap: () {
                                  playLocal();
                                  levelIs.level = 0;
                                },
                                id: "level_0",
                                selectedId: "level_${levelIs.level}",
                                innerImage: "level_3.png",
                              ),
                              LevelButton(
                                onTap: () {
                                  playLocal();
                                  levelIs.level = 1;
                                },
                                id: "level_1",
                                selectedId: "level_${levelIs.level}",
                                innerImage: "level_1.png",
                              ),
                              LevelButton(
                                onTap: () {
                                  playLocal();
                                  levelIs.level = 2;
                                },
                                id: "level_2",
                                selectedId: "level_${levelIs.level}",
                                innerImage: "level_2.png",
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<Level>(builder: (context, levelIs, child) {
                        return StartButton(onTap: () {
                          // dynamic _question = QuestionGenerator().additionQuestion();
                          // dynamic _question = QuestionGenerator().subtractionQuestion();
                          score = 0;
                          dynamic _question =
                              QuestionGenerator().randomQuestion();
                          int questionNumber = 1;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Game(
                                    level: levelIs.level,
                                    question: _question,
                                    questionNumber: questionNumber,
                                  )));
                        });
                      })
                    ],
                  ),
                ),
              )),
        ));
  }
}
