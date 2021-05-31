import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  Future<void> _waitToLoad(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.fade,
        child: MainScreen(),
        inheritTheme: true,
        ctx: context,
        childCurrent: SplashScreen(),
        // duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _waitToLoad(context);
    return Scaffold(
      body: Center(
        child: Icon(Icons.home),
      ),
    );
  }
}
