import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathermonitor/entitys/sensor.dart';
import 'package:weathermonitor/utils/api.dart';

class SensorsApi {
  static Future<List<Measure>> measures() async {
    print("GET => alerts()");

    String url = 'http://$DOMAIN/api/measures';

    http.Response response = await http.get(url);

    print('Response Body: ${response.body}');

    List<Measure> sensors = [];

    String result = '''[
        {
           "temperature":33.3,
           "air_moisture":22.22,
           "luminosity":55.5
        },
        {
           "temperature": 33.4,
           "air_moisture":21.98,
           "luminosity":62.8
        },
        {
           "temperature":33.5,
           "air_moisture":24.74,
           "luminosity":55.7
        },
        {
           "temperature":33.3,
           "air_moisture":22.17,
           "luminosity":55.3
        }
    ]''';

    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      sensors = map.map<Measure>((map) => Measure.fromMap(map)).toList();

      if (sensors.isEmpty) {
        map = json.decode(result);
        sensors = map.map<Measure>((map) => Measure.fromMap(map)).toList();
      }
    }

    return sensors;
  }
}
