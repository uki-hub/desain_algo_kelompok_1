import 'package:flutter/material.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';

final rumus = {
  'Luas': RumusBuilderModel(
    title: 'Luas Trapesium',
    color: Colors.blue,
    angka: [0, 0, 0],
    angkaTextHint: ['Sisi a', 'Sisi b', 'Tinggi'],
    hitung: (angka) => 0.5 * (angka[0] + angka[1]) * angka[2],
    rumusImageAsset: 'assets/images/rumus/luas_trapesium.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('½ * (${angka[0].toPlainString()} + ${angka[1].toPlainString()}) x ${angka[2].toPlainString()}', style: bold),
      Text('½ x (${(angka[0] * angka[1]).toPlainString()}) x ${angka[2].toPlainString()} = ${hasil.toPlainString()}', style: bold),
    ],
  ),
  'Keliling': RumusBuilderModel(
    title: 'Keliling Trapesium',
    color: Colors.yellow,
    angka: [0, 0, 0, 0],
    angkaTextHint: ['Sisi a', 'Sisi b', 'Sisi c', 'Sisi d'],
    hitung: (angka) => angka[0] + angka[1] + angka[2] + angka[3],
    rumusImageAsset: 'assets/images/rumus/keliling_trapesium.jpg',
    rumusText: (angka, hasil, reg, bold) => [
      Text('${angka[0].toPlainString()} + ${angka[1].toPlainString()} + ${angka[2].toPlainString()} + ${angka[3].toPlainString()} = ${hasil.toPlainString()}', style: reg),
    ],
  ),
  'Tinggi': RumusBuilderModel(
    title: 'Tinggi Trapesium',
    color: Colors.yellow,
    angka: [0, 0, 0],
    angkaTextHint: ['Luas', 'Sisi a', 'Sisi b'],
    hitung: (angka) => (2 * angka[0]) / (angka[1] + angka[2]),
    rumusText: (angka, hasil, reg, bold) => [
      Text('((2) x ${angka[0].toPlainString()}) : (${angka[1].toPlainString()} + ${angka[2].toPlainString()})', style: reg),
      Text('(${(2 * angka[0]).toPlainString()}) : (${(angka[1] + angka[2]).toPlainString()} = ${hasil.toPlainString()})', style: reg),
    ],
  ),
  'Sisi': RumusBuilderModel(
    title: 'Sisi Trapesium',
    color: Colors.yellow,
    angka: [0, 0, 0, 0],
    angkaTextHint: ['Keliling', 'Sisi a', 'Sisi b', 'Sisi c'],
    hitung: (angka) => angka[0] - angka[1] - angka[2] - angka[3],
    rumusText: (angka, hasil, reg, bold) => [
      Text('${angka[0].toPlainString()} - ${angka[1].toPlainString()} - ${angka[2].toPlainString()} - ${angka[3].toPlainString()} = ${hasil.toPlainString()})', style: reg),
    ],
  ),
};
