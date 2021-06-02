import 'package:flutter/cupertino.dart';

class PageMenuTileModel {
  final String? imageAsset;
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  final bool isSingleRow;

  const PageMenuTileModel({
    this.imageAsset,
    required this.text,
    required this.textColor,
    required this.onTap,
    this.isSingleRow: false,
  });
}
