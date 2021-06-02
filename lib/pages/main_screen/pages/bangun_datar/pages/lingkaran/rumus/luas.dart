import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kelompok_1/abstracts/base_basic_modal.dart';
import 'package:kelompok_1/common/pankat.dart';
import 'package:kelompok_1/pages/main_screen/widgets/fullscreen_image.dart';
import 'package:kelompok_1/widgets/custom_button.dart';
import 'package:kelompok_1/widgets/custom_form_text_number_field.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:page_transition/page_transition.dart';

class LingkaranLuas extends StatefulWidget implements BaseBasicModal {
  static const gColor = const Color(0xff957BF1);

  LingkaranLuas({Key? key}) : super(key: key);

  @override
  String? get imageAsset => null;

  @override
  Color get color => gColor;

  @override
  String get title => 'Luas Lingkaran';

  @override
  _LingkaranLuasState createState() => _LingkaranLuasState();
}

class _LingkaranLuasState extends State<LingkaranLuas> {
  static const String _rumusImageAsset = 'assets/images/rumus/luas_lingkaran.jpg';

  final _formKey = GlobalKey<FormState>();

  TextStyle get _penjelasanStyle => TextStyle(color: const Color(0xffbfbfbf), fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.18);
  TextStyle get _penjelasanStyleHighlighted => _penjelasanStyle.copyWith(fontWeight: FontWeight.bold);

  double? _angka1;
  double? _hasil;
  bool _submitted = false;

  void _validateOnChanged(String? _) {
    if (_submitted) _formKey.currentState!.validate();
  }

  Widget get _rumusImage {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.of(context).push(
          PageTransition(
              child: FullscreenImage(
                assetImage: _rumusImageAsset,
              ),
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 200),
              reverseDuration: Duration(milliseconds: 200)),
        );
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        child: Image(
          image: AssetImage(_rumusImageAsset),
          fit: BoxFit.fill,
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Column(
              children: [
                Icon(
                  Icons.broken_image_outlined,
                  color: Colors.grey[400],
                  size: (MediaQuery.of(context).size.height / 4) * 0.6,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget get _rumusText {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('π = 22/7', style: _penjelasanStyleHighlighted),
          Text('π x ${_angka1.toPlainString()}${pangkat['2']} = ${_hasil.toPlainString()}', style: _penjelasanStyleHighlighted),
          SizedBox(height: 5),
          Text('Rumus', style: _penjelasanStyleHighlighted),
          _rumusImage,
        ],
      ),
    );
  }

  List<Widget> _buildHasilSection() {
    if (_hasil == null) return [];

    return [
      SizedBox(height: 5),
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'Hasil = ${_hasil.toPlainString()}',
          style: TextStyle(
            fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.3,
            color: widget.color,
          ),
        ),
      ),
      SizedBox(height: 10),
      Divider(
        height: 0,
        color: widget.color,
        thickness: 1,
      ),
      SizedBox(height: 2),
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'Penjelasan',
          style: TextStyle(
            fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.23,
            color: widget.color,
          ),
        ),
      ),
      _rumusText
    ];
  }

  Widget _buildFormInput() {
    return CustomFormNumberField(
      color: widget.color,
      hintText: 'Jari jari',
      onChanged: _validateOnChanged,
      onSaved: (v) => _angka1 = double.parse(v!),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasilSection = _buildHasilSection();
    final formInputs = _buildFormInput();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          formInputs,
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Hitung',
              backgroundColor: widget.color,
              foregroundColor: Colors.white,
              onTap: () {
                setState(() => _submitted = true);
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  _formKey.currentState!.save();
                  setState(() {
                    _submitted = false;
                    _hasil = pi * pow(num.parse(_angka1!.toString()), 2).toDouble();
                  });
                }
              },
            ),
          ),
          ...hasilSection,
        ],
      ),
    );
  }
}
