import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Icons.home,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      backgroundColor: Colors.blue,
      screenFunction: () async {
        await Future.delayed(
          //TODO: wait to load the data
          Duration(seconds: 1),
        );

        return MainScreen();
      },
    );
  }
}
