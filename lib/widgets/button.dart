import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function onPressed;
  bool showProgress;
  Color color;

  DefaultButton(
    this.text, {
    this.onPressed,
    this.showProgress = false,
    this.color = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        color: color,
        disabledColor: color,
        onPressed: onPressed,
        child: showProgress ? _loader() : _text(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _text() {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  _loader() {
    return Container(
      width: 30,
      height: 30,
      padding: EdgeInsets.all(2),
      child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
    );
  }
}
