import 'package:flutter/material.dart';

class BangunDatar extends StatefulWidget {
  @override
  _BangunDatarState createState() => _BangunDatarState();
}

class _BangunDatarState extends State<BangunDatar> {
  bool _isDone = false;

  Future<void> delay() async {
    await Future.delayed(
      Duration(milliseconds: 400),
      () => setState(() => _isDone = !_isDone),
    );
  }

  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          setState(() {
            _isDone = false;
          });
          await Future.delayed(Duration(milliseconds: 350));
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color(0xff333333),
          body: Hero(
            tag: 'Bangun Datar',
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9 / 4,
                margin: const EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 20),
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  color: Color(0xff252526),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/bangun_datar_1.png'),
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    AnimatedPositioned(
                      bottom: _isDone ? -(MediaQuery.of(context).size.height * 0.9 / 4) * 0.4 : (MediaQuery.of(context).size.height * 0.9 / 4) * 0.4,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      child: Text(
                        'Bangun Datar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: ((MediaQuery.of(context).size.height * 0.9) * 0.1) * 0.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
