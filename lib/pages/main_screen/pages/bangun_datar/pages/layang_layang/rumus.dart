import 'package:flutter/material.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
  'Luas': RumusBuilderModel(
    title: 'Luas Layang Layang',
    color: Colors.blue,
    angka: [0, 0],
    angkaTextHint: ['Diagonal 1', 'Diagonal 2'],
    hitung: (angka) => 0.5 * (angka[0] * angka[1]),
    rumusImageAsset: 'assets/images/rumus/luas_layang_layang.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('½ * (${angka[0].toPlainString()} * ${angka[1].toPlainString()})', style: bold),
      Text('½ x (${(angka[0] * angka[1]).toPlainString()}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Keliling': RumusBuilderModel(
    title: 'Keliling Layang Layang',
    color: Colors.yellow,
    angka: [0, 0, 0, 0],
    angkaTextHint: ['Sisi a', 'Sisi b', 'Sisi c', 'Sisi d'],
    hitung: (angka) => angka[0] + angka[1] + angka[2] + angka[3],
    rumusImageAsset: 'assets/images/rumus/keliling_layang_layang.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('${angka[0].toPlainString()} + ${angka[1].toPlainString()} + ${angka[2].toPlainString()} + ${angka[3].toPlainString()} = ${hasil.toPlainString()}', style: reg),
    ],
  ),
};
