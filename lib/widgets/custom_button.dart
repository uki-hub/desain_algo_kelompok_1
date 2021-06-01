import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.1 * 0.35),
      ),
      style: ElevatedButton.styleFrom(        
        padding: EdgeInsets.all(3),
        primary: backgroundColor,
        onPrimary: foregroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      ),
    );
  }
}
