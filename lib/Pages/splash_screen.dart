import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute:HomePage(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "images/poke_ball.png",
      text: "POKELAND",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      ),
      backgroundColor: Colors.white,
    );
  }
}