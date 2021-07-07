import 'package:shared_preferences/shared_preferences.dart';

abstract class PlayerBase {
  Future<String> getPlayerName();
}

class Player implements PlayerBase {
  
  @override
  Future<String> getPlayerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String playerName = prefs.getString('player_name');
    print("player name is : ==== $playerName");
    return playerName;
  }

}
