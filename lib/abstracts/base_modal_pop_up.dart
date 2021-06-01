import 'package:flutter/material.dart';

abstract class BaseModalPopUp {
  final Widget title;
  final Widget content;
  final Widget? actions;
  bool showCloseIcon = true;
  EdgeInsetsGeometry contentPadding = EdgeInsets.all(10) ;
  double gapBetweenTitleContent = 0;
  double gapBetweenContentActions = 0;
  

  BaseModalPopUp({
    required this.title,
    required this.content,
    required this.actions,    
  });
}