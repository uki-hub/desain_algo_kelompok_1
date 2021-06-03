import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _border = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: const BorderRadius.all(
    const Radius.circular(7.0),
  ),
);

class CustomFormNumberField extends StatefulWidget {
  final Color? color;
  final String? hintText;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final double? bottomMargin;
  final double? gap;

  const CustomFormNumberField({
    Key? key,
    @required this.color,
    this.hintText,
    this.onValidate,
    this.onChanged,
    this.onSaved,
    this.gap,
    this.bottomMargin,
  }) : super(key: key);

  @override
  _CustomFormNumberFieldState createState() => _CustomFormNumberFieldState();
}

class _CustomFormNumberFieldState extends State<CustomFormNumberField> {
  bool _hasValue = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: widget.color,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: widget.color,
          selectionColor: widget.color,
          selectionHandleColor: widget.color, //TODO: notWorking???
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: widget.bottomMargin ?? 0, right: widget.gap ?? 0),
        child: TextFormField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.25,
            fontWeight: FontWeight.w800,
          ),
          inputFormatters: [
            //TODO: PR
          ],
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintMaxLines: _hasValue ? 1 : 3,
            errorMaxLines: 3,
            contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border,
            hintStyle: TextStyle(
              fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.25,
              fontWeight: FontWeight.w800,
            ),
            errorStyle: TextStyle(
              color: Colors.red[600],
              fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.2,
            ),
          ),
          validator: (v) {
            if (v!.isEmpty) {
              return 'Ga bisa kosong \u2639 ';
            }
            if (widget.onValidate != null) widget.onValidate!(v);
          },
          onChanged: (v) {
            if (v.isEmpty) {
              if (_hasValue == true) setState(() => _hasValue = false);
            } else {
              if (_hasValue == false) setState(() => _hasValue = true);
            }

            if (widget.onChanged != null) widget.onChanged!(v);
          },
          onSaved: widget.onSaved,
        ),
      ),
    );
  }
}
