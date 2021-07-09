import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:unit7_mobile_dev/app/providers/player_provider.dart';
import 'package:unit7_mobile_dev/landing_page.dart';
import 'package:unit7_mobile_dev/utils.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<PlayerBase>(
        create: (context) => Player(),
        child: MaterialApp(
          title: 'Unit7 Mobile Development',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreenView(
            home: LandingPage(),
            duration: 5000,
            imageSize: 274,
            imageSrc: "assets/splashscreen_image.png",
            backgroundColor: Unit7Colors.colorWhite,
          ),
        ));
  }
}
