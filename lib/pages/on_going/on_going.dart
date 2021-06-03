import 'package:flutter/material.dart';

class OnGoing extends StatelessWidget {
  const OnGoing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Navigator.of(context).pop,
      child: Material(
        color: const Color(0xff252526),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 300,
                width: 400,
                child: Image(
                  image: AssetImage('assets/gifs/spinning_seal.gif'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'It will be ready when it\'s ready',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 28,
                ),
              ),
              Text(
                'Tap the seal to back to your reality',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
