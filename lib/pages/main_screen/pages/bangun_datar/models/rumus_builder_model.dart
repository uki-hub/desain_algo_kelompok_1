import 'package:flutter/material.dart';

class RumusBuilderModel {
  final String title;
  final String? rumusImageAsset;
  final Color color;
  final List<double> angka;
  final List<String> angkaTextHint;
  final double Function(List<double>) hitung;
  final List<Widget> Function(List<double> angka, double hasil, TextStyle reg, TextStyle bold) rumusText;
  final bool isSingleRow;

  RumusBuilderModel({
    required this.angka,
    required this.angkaTextHint,
    required this.hitung,
    required this.rumusText,
    required this.title,
    required this.color,
    this.rumusImageAsset,
    this.isSingleRow: false,
  });
}
