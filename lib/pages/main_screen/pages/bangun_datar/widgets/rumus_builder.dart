import 'package:flutter/material.dart';
import 'package:kelompok_1/abstracts/base_basic_modal.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';
import 'package:kelompok_1/pages/main_screen/widgets/fullscreen_image.dart';
import 'package:kelompok_1/widgets/custom_button.dart';
import 'package:kelompok_1/widgets/custom_form_text_number_field.dart';
import 'package:kelompok_1/extensions/double.dart';
import 'package:page_transition/page_transition.dart';

class RumusBuilder extends StatefulWidget implements BaseBasicModal {
  final RumusBuilderModel model;

  const RumusBuilder(this.model, {Key? key}) : super(key: key);

  @override
  String? get imageAsset => null;

  @override
  Color get color => model.color;

  @override
  String get title => model.title;

  @override
  _RumusBuilderState createState() => _RumusBuilderState();
}

class _RumusBuilderState extends State<RumusBuilder> {
  String? get _rumusImageAsset => widget.model.rumusImageAsset;

  final _formKey = GlobalKey<FormState>();

  TextStyle get _penjelasanStyle => TextStyle(color: const Color(0xffbfbfbf), fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.18, height: 1.5);
  TextStyle get _penjelasanStyleHighlighted => _penjelasanStyle.copyWith(fontWeight: FontWeight.bold);

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
                assetImage: _rumusImageAsset!,
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
          image: AssetImage(_rumusImageAsset!),
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
    final rumusImage = _rumusImageAsset == null
        ? []
        : [
            SizedBox(height: 5),
            Text('Rumus', style: _penjelasanStyleHighlighted),
            _rumusImage,
          ];

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...widget.model.rumusText(widget.model.angka, _hasil!, _penjelasanStyle, _penjelasanStyleHighlighted),
          ...rumusImage,
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
    if (widget.model.angka.length == 2) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < widget.model.angka.length; i++)
            Expanded(
              child: CustomFormNumberField(
                color: widget.color,
                hintText: widget.model.angkaTextHint[i],
                onChanged: _validateOnChanged,
                onSaved: (v) => widget.model.angka[i] = double.parse(v!),
                gap: i == widget.model.angka.length - 1 ? null : 10,
              ),
            ),
        ],
      );
    } else {
      return Column(
        children: [
          for (var i = 0; i < widget.model.angka.length; i++)
            CustomFormNumberField(
              color: widget.color,
              hintText: widget.model.angkaTextHint[i],
              onChanged: _validateOnChanged,
              onSaved: (v) => widget.model.angka[i] = double.parse(v!),
              bottomMargin: i == widget.model.angka.length - 1 ? null : 10,
            ),
        ],
      );
    }
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
                    _hasil = widget.model.hitung(widget.model.angka);
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
