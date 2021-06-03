import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kelompok_1/common/pankat.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
  'Luas': RumusBuilderModel(
    title: 'Luas Lingkaran',
    color: Colors.blue,
    angka: [0],
    angkaTextHint: ['Jari jari'],
    hitung: (angka) => pi * pow(num.parse(angka[0].toString()), 2).toDouble(),
    rumusImageAsset: 'assets/images/rumus/luas_lingkaran.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('π = 22/7', style: reg),
      Text('π x ${angka[0].toPlainString()}${pangkat['2']} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Keliling': RumusBuilderModel(
    title: 'Keliling Lingkaran',
    color: Colors.yellow,
    angka: [0],
    angkaTextHint: ['Diameter'],
    hitung: (angka) => (pi * angka[0]),
    rumusImageAsset: 'assets/images/rumus/keliling_lingkaran.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('π = 22/7', style: reg),
      Text('π x (${angka[0].toPlainString()} x 2)', style: bold),
      Text('π x (${(angka[0] * 2).toPlainString()}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
};
