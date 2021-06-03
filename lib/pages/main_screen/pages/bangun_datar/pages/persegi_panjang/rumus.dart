import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
  'Luas': RumusBuilderModel(
    title: 'Luas Persegi Panjang',
    color: Colors.blue,
    angka: [0, 0],
    angkaTextHint: ['Panjang', 'Lebar'],
    hitung: (angka) => angka[0] * angka[1],
    rumusImageAsset: 'assets/images/rumus/luas_persegi_panjang.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('(${angka[0].toPlainString()}  ${angka[1].toPlainString()}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Keliling': RumusBuilderModel(
    title: 'Keliling Persegi Panjang',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Panjang', 'Lebar'],
    hitung: (angka) => (2) * (angka[0] * angka[1]),
    rumusImageAsset: 'assets/images/rumus/keliling_persegi_panjang.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('(2) x (${angka[0].toPlainString()} x ${angka[1].toPlainString()})', style: bold),
      Text('(2) x (${(angka[0] * angka[1]).toPlainString()}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Diagonal': RumusBuilderModel(
    title: 'Diagonal Persegi Panjang',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Panjang', 'Lebar'],
    hitung: (angka) => sqrt(angka[0] * angka[0]) + sqrt(angka[1] * angka[1]),
    rumusText: (angka, hasil, reg, bold) => [
      Text('√(${angka[0].toPlainString()} x ${angka[0].toPlainString()}) + (${angka[1].toPlainString()} x ${angka[1].toPlainString()})', style: bold),
      Text('√(${pow(angka[0].toNum(), 2)}) + (${pow(angka[1], 2)}) = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Mencari panjang dengan Luas': RumusBuilderModel(
    isSingleRow: true,
    title: 'Panjang, Persegi Panjang dari Luas',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Luas', 'Lebar'],
    hitung: (angka) => angka[0] / angka[1],
    rumusText: (angka, hasil, reg, bold) => [
      Text('${angka[0].toPlainString()} : ${angka[1].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Mencari panjang dengan Keliling': RumusBuilderModel(
    isSingleRow: true,
    title: 'Panjang, Persegi Panjang dari Keliling',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Keliling', 'Lebar'],
    hitung: (angka) => (angka[0] / 2) - angka[1],
    rumusText: (angka, hasil, reg, bold) => [
      Text('(${angka[0].toPlainString()} : (2)) - ${angka[1].toPlainString()}', style: bold),
      Text('(${(angka[0]/2).toPlainString()}) - ${angka[1].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Mencari Lebar dengan Luas': RumusBuilderModel(
    isSingleRow: true,
    title: 'Lebar, Persegi Panjang dari Luas',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Luas', 'Panjang'],
    hitung: (angka) => angka[0] / angka[1],
    rumusText: (angka, hasil, reg, bold) => [
      Text('(${angka[0].toPlainString()} : ${angka[1].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Mencari Lebar dengan Keliling': RumusBuilderModel(
    isSingleRow: true,
    title: 'Lebar, Persegi Panjang dari Keliling',
    color: Colors.yellow,
    angka: [0, 0],
    angkaTextHint: ['Keliling', 'Panjang'],
    hitung: (angka) => (angka[0] / 2) - angka[1],
    rumusText: (angka, hasil, reg, bold) => [
      Text('(${angka[0].toPlainString()} : (2)) - ${angka[1].toPlainString()}', style: bold),
      Text('(${(angka[0]/2).toPlainString()}) - ${angka[1].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
};
