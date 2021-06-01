import 'package:flutter/material.dart';
import 'package:kelompok_1/abstracts/base_basic_modal.dart';
import 'package:kelompok_1/widgets/custom_button.dart';
import 'package:kelompok_1/widgets/custom_form_text_number_field.dart';
import 'package:kelompok_1/extensions/double.dart';

class Penjumlahan extends StatefulWidget implements BaseBasicModal {
  static const gColor = const Color(0xffffaa00);
  static const gImageAsset = 'assets/images/penjumlahan.png';

  Penjumlahan({Key? key}) : super(key: key);

  @override
  String get imageAsset => gImageAsset;

  @override
  _PenjumlahanState createState() => _PenjumlahanState();

  @override
  Color get color => gColor;

  @override
  String get title => 'Penjumlahan';
}

class _PenjumlahanState extends State<Penjumlahan> {
  final _formKey = GlobalKey<FormState>();

  TextStyle get _penjelasanStyle => TextStyle(color: const Color(0xffbfbfbf), fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.18);
  TextStyle get _penjelasanStyleHighlighted => _penjelasanStyle.copyWith(fontWeight: FontWeight.bold);

  double? _angka1;
  double? _angka2;
  double? _hasil;
  bool _submitted = false;

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
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(style: _penjelasanStyleHighlighted, text: _angka1.toPlainString()),
              TextSpan(style: _penjelasanStyle, text: ' + '),
              TextSpan(style: _penjelasanStyleHighlighted, text: _angka2.toPlainString()),
              TextSpan(style: _penjelasanStyle, text: ' = '),
              TextSpan(style: _penjelasanStyleHighlighted, text: _hasil.toPlainString()),
            ],
          ),
        ),
      )
    ];
  }

  void _validateOnChanged(String? _) {
    if (_submitted) _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final hasilSection = _buildHasilSection();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomFormNumberField(
                  color: widget.color,
                  hintText: 'Angka Pertama',
                  onChanged: _validateOnChanged,
                  onSaved: (v) => _angka1 = double.parse(v!),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomFormNumberField(
                  color: widget.color,
                  hintText: 'Angka Kedua',
                  onChanged: _validateOnChanged,
                  onSaved: (v) => _angka2 = double.parse(v!),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Jumlah',
              backgroundColor: widget.color,
              foregroundColor: Colors.white,
              onTap: () {
                setState(() => _submitted = true);
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).requestFocus();
                  _formKey.currentState!.save();
                  setState(() {
                    _submitted = false;
                    _hasil = _angka1! + _angka2!;
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
