import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class OnGoing extends StatefulWidget {
  const OnGoing({Key? key}) : super(key: key);

  @override
  _OnGoingState createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
  AudioPlayer? player;

  void playAudio() async {
    player = AudioPlayer();
    await player!.setAsset('assets/audio/chill.mp3');
    player!.setLoopMode(LoopMode.one);
    player!.play();
  }

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  @override
  Widget build(BuildContext context) {
    playAudio();

    return GestureDetector(
      onTap: () async {
        await player!.stop();
        await player!.dispose();

        Navigator.of(context).pop();
      },
      child: WillPopScope(
        onWillPop: () async {
          await player!.stop();
          await player!.dispose();
          return true;
        },
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
                  'Tap the seal to back to reality',
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
      ),
    );
  }
}
