import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

Future pushReplacement(BuildContext context, Widget page) {
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

Future pushAndRemoveUntil(BuildContext context, Widget page) {
  return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return page;
    },
  ), ModalRoute.withName('/'));
}
