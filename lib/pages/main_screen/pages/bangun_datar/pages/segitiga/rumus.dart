import 'package:flutter/material.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
    'Luas': RumusBuilderModel(
      title: 'Luas Segitiga',
      color: Colors.blue,
      angka: [0, 0],
      angkaTextHint: ['Alas', 'Tinggi'],
      hitung: (angka) => (angka[0] * angka[1]) * 0.5,
      rumusImageAsset: 'assets/images/rumus/luas_segitiga.jpg',
      rumusText: (angka, hasil, reg, bold) => [
        Text('½ x (${angka[0].toPlainString()} x ${angka[1].toPlainString()}) = ${hasil.toPlainString()}', style: bold),
        Text('½ x (${(angka[0] * angka[1]).toPlainString()}) = ${hasil.toPlainString()}', style: bold),
      ],
    ),
    'Keliling': RumusBuilderModel(
      title: 'Keliling Segitiga',
      color: Colors.yellow,
      angka: [0, 0, 0],
      angkaTextHint: ['Sisi 1', 'Sisi 2', 'Sisi 3'],
      hitung: (angka) => angka[0] + angka[1] + angka[2],
      rumusImageAsset: 'assets/images/rumus/keliling_segitiga.jpg',
      rumusText: (angka, hasil, reg, bold) => [
        Text('${angka[0].toPlainString()} + ${angka[1].toPlainString()} + ${angka[2].toPlainString()} = ${hasil.toPlainString()}', style: reg),
      ],
    ),
  };