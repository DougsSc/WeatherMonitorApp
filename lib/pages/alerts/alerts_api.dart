import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathermonitor/entitys/alert.dart';
import 'package:weathermonitor/utils/api.dart';

class AlertApi {
  static Future<List<Alert>> alerts() async {
    print("GET => alerts()");

    String url = 'http://$DOMAIN/api/alerts';

    http.Response response = await http.get(url);

    print('Response Body: ${response.body}');

    List<Alert> alerts = [];
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      alerts = map.map<Alert>((map) => Alert.fromMap(map)).toList();
    }

    return alerts;
  }
}
