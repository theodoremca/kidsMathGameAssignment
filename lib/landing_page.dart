import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:unit7_mobile_dev/app/dashboard.dart';
import 'package:unit7_mobile_dev/app/enter_player_name.dart';
import 'package:unit7_mobile_dev/app/providers/player_provider.dart';

import 'app/themeAudio.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}



class _LandingPageState extends State<LandingPage> {
  final AudioPlayer _player = AudioPlayer();

  playLocal() async {



    // int result = await audioPlayer.play('audiosthemesound.mp3', isLocal: true);
  }
  @override
  void initState() {

_init();
  }


  Future<void> _init() async {
    await _player.setAsset('assets/theme.wav');
    await _player.setLoopMode(LoopMode.one);
    _player.play();
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });

    // Try to load audio from a source and catch any errors.
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<PlayerBase>(
      //                    <--- Consumer
      builder: (context, _player, child) {
          return FutureBuilder(builder: (context, projectSnap){
            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              return Container(color: Color.fromRGBO(255, 246, 229, 1));
            }
            if ( projectSnap.data == null) {
              return PlayerName();
            }

            return Dashboard();
          },
          future: _player.getPlayerName());
      },
    );
  }
}
