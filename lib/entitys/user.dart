import 'dart:convert';

import 'package:weathermonitor/utils/prefs.dart';

class User {
  String email;
  String password;
  String firebase;
  String token;

  User({
    this.email,
    this.password,
    this.firebase,
    this.token,
  });

  static const element = 'user';

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  User.fromMap(Map<String, dynamic> map) {
    email = map['email'];
    password = map['password'];
    firebase = map['firebase'];
    token = map['token'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['firebase'] = this.firebase;
    data['token'] = this.token;
    return data;
  }

  void save() => Prefs.setString(element, toJson());

  static Future<User> get() async {
    String prefs = await Prefs.getString(element);
    if (prefs.isEmpty) return null;
    return User.fromJson(prefs);
  }
}
