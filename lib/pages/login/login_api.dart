import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathermonitor/utils/api.dart';
import 'package:weathermonitor/utils/api_response.dart';

class LoginApi {
  static Future<ApiResponse> login(login, password) async {
    print("GET => login()");

    String url = 'http://$DOMAIN/api/user/login';

    print(url);
    String body = json.encode({
      "email": login,
      "password": password,
    });

    print(body);

    http.Response response = await http.post(url, body: body, headers: {
      'Content-Type': 'application/json'
    });

    print('Response Body: ${response.body}');
    final map = json.decode(response.body);

    if (response.statusCode == 200) return ApiResponse.ok(map);

    return ApiResponse.error(map['message']);
  }
}
