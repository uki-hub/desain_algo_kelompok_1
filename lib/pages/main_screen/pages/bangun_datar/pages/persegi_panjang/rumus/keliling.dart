import 'package:flutter/material.dart';
import 'package:kelompok_1/abstracts/base_basic_modal.dart';
import 'package:kelompok_1/pages/main_screen/widgets/fullscreen_image.dart';
import 'package:kelompok_1/widgets/custom_button.dart';
import 'package:kelompok_1/widgets/custom_form_text_number_field.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:page_transition/page_transition.dart';

class PersegiPanjangKeliling extends StatefulWidget implements BaseBasicModal {
  static const gColor = const Color(0xff957BF1);

  PersegiPanjangKeliling({Key? key}) : super(key: key);

  @override
  String? get imageAsset => null;

  @override
  Color get color => gColor;

  @override
  String get title => 'Keliling Persegi Panjang';

  @override
  _PersegiPanjangKelilingState createState() => _PersegiPanjangKelilingState();
}

class _PersegiPanjangKelilingState extends State<PersegiPanjangKeliling> {
  static const String _rumusImageAsset = 'assets/images/rumus/keliling_persegi_panjang.jpg';

  final _formKey = GlobalKey<FormState>();

  TextStyle get _penjelasanStyle => TextStyle(color: const Color(0xffbfbfbf), fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.18);
  TextStyle get _penjelasanStyleHighlighted => _penjelasanStyle.copyWith(fontWeight: FontWeight.bold);

  double? _angka1;
  double? _angka2;
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
          Text('(2) x (${_angka1.toPlainString()} x ${_angka2.toPlainString()})', style: _penjelasanStyleHighlighted),
          Text('(2) x (${(_angka1! * _angka2!).toPlainString()}) = ${_hasil.toPlainString()}', style: _penjelasanStyleHighlighted),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomFormNumberField(
            color: widget.color,
            hintText: 'Panjang',
            onChanged: _validateOnChanged,
            onSaved: (v) => _angka1 = double.parse(v!),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomFormNumberField(
            color: widget.color,
            hintText: 'Lebar',
            onChanged: _validateOnChanged,
            onSaved: (v) => _angka2 = double.parse(v!),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formInputs = _buildFormInput();
    final hasilSection = _buildHasilSection();

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
                    _hasil = (2 * (_angka1! * _angka2!));
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
