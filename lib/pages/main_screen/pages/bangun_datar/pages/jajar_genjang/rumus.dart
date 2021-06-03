import 'package:flutter/material.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
  'Luas': RumusBuilderModel(
    title: 'Luas Jajar Genjang',
    color: Colors.blue,
    angka: [0, 0],
    angkaTextHint: ['Alas', 'Tinggi'],
    hitung: (angka) => angka[0] * angka[1],
    rumusImageAsset: 'assets/images/rumus/luas_jajar_genjang.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('(${angka[0].toPlainString()}  ${angka[1].toPlainString()}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Keliling': RumusBuilderModel(
    title: 'Keliling Jajar Genjang',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Sisi a', 'Sisi b'],
    hitung: (angka) => (2) * (angka[0] * angka[1]),
    rumusImageAsset: 'assets/images/rumus/keliling_jajar_genjang.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('(2) x (${angka[0].toPlainString()} x ${angka[1].toPlainString()})', style: bold),
      Text('(2) x (${(angka[0] * angka[1]).toPlainString()}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
};
