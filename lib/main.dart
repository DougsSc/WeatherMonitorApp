import 'package:flutter/material.dart';
import 'package:weathermonitor/pages/login/login_page.dart';

void main() => runApp(
  MaterialApp(
    home: LoginPage(),
    title: 'Weather Monitor',
    theme: ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(brightness: Brightness.dark),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      primaryColor: Colors.blueGrey,
      accentColor: Colors.blueGrey,
      cursorColor: Colors.blueGrey,
      canvasColor: Colors.transparent,
    ),
    debugShowCheckedModeBanner: false,
  ),
);