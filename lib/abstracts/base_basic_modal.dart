import 'package:flutter/cupertino.dart';

abstract class BaseBasicModal extends Widget {
  final String? imageAsset;
  final Color color;
  final String title;

  BaseBasicModal({
    required this.color,
    required this.title,
    this.imageAsset,
  });
}
