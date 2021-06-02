import 'package:flutter/material.dart';

class FullscreenImage extends StatelessWidget {
  
  final String assetImage;

  const FullscreenImage({Key? key, required this.assetImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Container(
        color: Colors.black,
        child: Image(
          image: AssetImage(assetImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
