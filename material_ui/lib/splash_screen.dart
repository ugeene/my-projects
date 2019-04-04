import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './home.dart';


class LandingPage extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 7,

      //Will have to change the route
      navigateAfterSeconds: Home(),

      image: Image.asset(
        'images/background_img.png',
      ),

      backgroundColor: Color.fromARGB(255, 45, 65, 82),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 170.0,

      // This will do something
      //onClick: ()=>print("Will Do something"),
      loaderColor: Colors.white,
    );
  }
}