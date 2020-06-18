import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  String hint;
  bool password;
  TextEditingController controller;
  TextInputType keyboardType;
  bool autofocus;
  TextAlign textAlign;

  DefaultTextField(this.hint, {
    this.password = false,
    this.autofocus = false,
    this.controller,
    this.keyboardType,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      textAlign: textAlign,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: hint,
        contentPadding: EdgeInsets.all(0),
        hintText: "",
        hintStyle: TextStyle(fontSize: 16),
      ),
    );
  }
}
