import 'package:flutter/cupertino.dart';

class PageMenuTileModel {
  final Widget icon;
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;

  const PageMenuTileModel({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
  });
}
