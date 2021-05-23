import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/splash_screen/splash_screen.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aritmatika dan Bangun Datar',
      onGenerateRoute: (settings) {
        switch (settings.name) {            
          case '/':
            return MaterialPageRoute(builder: (context) => SplashScreen());
          default:
            return MaterialPageRoute(builder: (context) => Container());
        }
      },
    );
  }
}
