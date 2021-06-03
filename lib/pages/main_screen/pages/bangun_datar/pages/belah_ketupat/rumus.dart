import 'package:flutter/material.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
  'Luas': RumusBuilderModel(
    title: 'Luas Belah Ketupat',
    color: Colors.blue,
    angka: [0, 0],
    angkaTextHint: ['Diagonal 1', 'Diagonal 2'],
    hitung: (angka) => 0.5 * (angka[0] * angka[1]),
    rumusImageAsset: 'assets/images/rumus/luas_belah_ketupat.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('½ (${angka[0].toPlainString()} x ${angka[1].toPlainString()})}', style: bold),
      Text('½ (${(angka[0] * angka[1]).toPlainString()}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Keliling': RumusBuilderModel(
    title: 'Keliling Belah Ketupat',
    color: Colors.yellow,
    angka: [0],
    angkaTextHint: ['Sisi a'],
    hitung: (angka) => 4 * angka[0],
    rumusImageAsset: 'assets/images/rumus/keliling_belah_ketupat.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('(4) x ${angka[0].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Sisi': RumusBuilderModel(
    title: 'Sisi Belah Ketupat',
    color: Colors.yellow,
    angka: [0],
    angkaTextHint: ['Keliling'],
    hitung: (angka) => angka[0] / 4,
    rumusText: (angka, hasil, reg, bold) => [
      Text('${angka[0].toPlainString()} : (4) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Diagonal 1': RumusBuilderModel(
    isSingleRow: true,
    title: 'Diagonal 1 Belah Ketupat',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Luas', 'Diagonal 2'],
    hitung: (angka) => 2 * angka[0] / angka[1],
    rumusText: (angka, hasil, reg, bold) => [
      Text('(2) x ${angka[0].toPlainString()} : ${angka[1].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Diagonal 2': RumusBuilderModel(
    isSingleRow: true,
    title: 'Diagonal 2 Belah Ketupat',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Luas', 'Diagonal 1'],
    hitung: (angka) => 2 * angka[0] / angka[1],
    rumusText: (angka, hasil, reg, bold) => [
      Text('(2) x ${angka[0].toPlainString()} : ${angka[1].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
};
