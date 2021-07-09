import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit7_mobile_dev/app/dashboard.dart';
import 'package:unit7_mobile_dev/app/enter_player_name.dart';
import 'package:unit7_mobile_dev/app/providers/player_provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache;
  String filePath = 'audios/themesound.mp3';

  playLocal() async {
    await audioCache.play(filePath);
    // int result = await audioPlayer.play('audios/themesound.mp3', isLocal: true);
  }
  @override
  void initState() {
    super.initState();
    playLocal();
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
