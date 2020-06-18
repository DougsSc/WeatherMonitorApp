import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  String text;
  double fontSize;
  bool isBold;
  TextAlign textAlign;
  Color color;

  Label(
    this.text, {
    this.fontSize,
    this.isBold = true,
    this.textAlign,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? Theme.of(context).primaryColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
