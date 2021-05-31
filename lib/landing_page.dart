import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/splash_screen/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aritmatika dan Bangun Datar',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SplashScreen());
          case '/user_preferences':
            return MaterialPageRoute(builder: (context) => SplashScreen());
        //   case '/aritmatika':
        //     return PageTransition(
        //       type: PageTransitionType.scale,
        //       child: Aritmatika(),
        //       alignment: Alignment.center
        //     );
        //   case '/aritmatika_hero':
        //    return MaterialPageRoute(builder: (context) => Aritmatika());
        //   case '/bangun_datar':
        //     return MaterialPageRoute(builder: (context) => SplashScreen());
          case '/about':
            return MaterialPageRoute(builder: (context) => SplashScreen());
          default:
            return null;
        }
      },
    );
  }
}
