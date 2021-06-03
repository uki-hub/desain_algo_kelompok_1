import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  Future<void> _waitToLoad(BuildContext context) async {
    await Future.delayed(Duration(seconds: 600));
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
    return Material(
      color: const Color(0xff333333),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image(
                image: AssetImage('assets/icons/icon.png'),
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'ARITMATIKA DAN BANGUN DATAR',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.3,
              ),
            ),
            Text(
              'by Kelompok 1',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
