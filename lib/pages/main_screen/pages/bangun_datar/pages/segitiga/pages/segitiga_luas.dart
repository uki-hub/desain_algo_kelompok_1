import 'package:flutter/material.dart';
import 'package:kelompok_1/abstracts/base_basic_modal.dart';
import 'package:kelompok_1/widgets/custom_button.dart';
import 'package:kelompok_1/widgets/custom_form_text_number_field.dart';
import 'package:kelompok_1/extensions/double.dart';

class SegitiaLuas extends StatefulWidget implements BaseBasicModal {
  static const gColor = const Color(0xff957BF1);

  SegitiaLuas({Key? key}) : super(key: key);

  @override
  String? get imageAsset => null;

  @override
  Color get color => gColor;

  @override
  String get title => 'Luas Segitiga';

  @override
  _SegitiaLuasState createState() => _SegitiaLuasState();
}

class _SegitiaLuasState extends State<SegitiaLuas> {
  final _formKey = GlobalKey<FormState>();

  TextStyle get _penjelasanStyle => TextStyle(color: const Color(0xffbfbfbf), fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.18);
  TextStyle get _penjelasanStyleHighlighted => _penjelasanStyle.copyWith(fontWeight: FontWeight.bold);

  double? _angka1;
  double? _angka2;
  double? _hasil;
  bool _submitted = false;

  Widget get _rumusImage {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: Image(
        image: NetworkImage('https://i1.wp.com/saintif.com/wp-content/uploads/202/07/Slide1-9.jpg?fit=1024%2C576&ssl=1'),
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
    );
  }

  Widget get _rumusText {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rumus',
            style: _penjelasanStyleHighlighted,
          ),
          _rumusImage,
          SizedBox(height: 10),
          Text('½ x ${_angka1.toPlainString()} x ${_angka2.toPlainString()} = ${_hasil.toPlainString()}', style: _penjelasanStyleHighlighted),
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
                  hintText: 'Sisi Pertama',
                  onChanged: _validateOnChanged,
                  onSaved: (v) => _angka1 = double.parse(v!),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomFormNumberField(
                  color: widget.color,
                  hintText: 'Sisi Kedua',
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
              text: 'Hitung',
              backgroundColor: widget.color,
              foregroundColor: Colors.white,
              onTap: () {
                setState(() => _submitted = true);
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).requestFocus();
                  _formKey.currentState!.save();
                  setState(() {
                    _submitted = false;
                    _hasil = (_angka1! * _angka2!) * 0.5;
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
