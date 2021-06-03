import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kelompok_1/common/pankat.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
  'Luas': RumusBuilderModel(
    title: 'Luas Persegi',
    color: Colors.blue,
    angka: [0],
    angkaTextHint: ['Sisi'],
    hitung: (angka) => pow(num.parse(angka[0].toString()), 2).toDouble(),
    rumusImageAsset: 'assets/images/rumus/luas_persegi.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('${angka[0].toPlainString()}${pangkat['2']} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Keliling': RumusBuilderModel(
    title: 'Keliling Persegi',
    color: Colors.yellow,
    angka: [0],
    angkaTextHint: ['Sisi'],
    hitung: (angka) => angka[0] * 4,
    rumusImageAsset: 'assets/images/rumus/keliling_persegi.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('(4) x ${angka[0].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
};
