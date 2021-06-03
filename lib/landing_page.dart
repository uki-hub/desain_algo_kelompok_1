import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/on_going/on_going.dart';
import 'package:kelompok_1/pages/splash_screen/splash_screen.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff252526),
        accentColor: const Color(0xff252526),
        textSelectionTheme: TextSelectionThemeData(selectionHandleColor: const Color(0xff3C3C3C)),
      ),
      title: 'Aritmatika dan Bangun Datar',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SplashScreen());
          case '/settings':
            return MaterialPageRoute(builder: (context) => OnGoing());
          case '/beri_rating':
            return MaterialPageRoute(builder: (context) => OnGoing());
          case '/about':
            return MaterialPageRoute(builder: (context) => OnGoing());
          default:
            return null;
        }
      },
    );
  }
}
