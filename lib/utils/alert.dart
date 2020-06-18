import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlert(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) => getDialog(
      title,
      content,
      [getAction('OK', () => Navigator.of(context).pop(), isDefault: true)],
    ),
  );
}

showError(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (BuildContext context) => getDialog(
       'Erro',
      error,
      [getAction('OK', () => Navigator.of(context).pop(), isDefault: true)],
    ),
  );
}

dynamic getDialog(String title, String content, List<Widget> actions) {
  if (Platform.isIOS) {
    return CupertinoAlertDialog(
        title: Text(title), content: Text(content), actions: actions);
  } else {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      actions: actions,
      title: Text(title),
      content: Text(content),
    );
  }
}

dynamic getAction(String title, Function onPressed,
    {isDefault = false, isDestructive = false}) {
  if (Platform.isIOS) {
    return CupertinoDialogAction(
        isDefaultAction: isDefault,
        isDestructiveAction: isDestructive,
        child: Text(title),
        onPressed: onPressed);
  } else {
    return FlatButton(
      child: Text(title),
      onPressed: onPressed,
    );
  }
}

showSnackBar(ScaffoldState state, String content) {
  state.showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: Theme.of(state.context).primaryColor,
    action: SnackBarAction(
      label: 'OK',
      textColor: Colors.white,
      onPressed: () => state.hideCurrentSnackBar,
    ),
  ));
}