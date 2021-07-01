import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _waitToLoad(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 9000));
    Navigator.of(context, rootNavigator: true).push(
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
  void initState() { 
    super.initState();
    _waitToLoad(context);    
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff333333),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.25,
                ),
              ),
              Text(
                'by Kelompok 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
