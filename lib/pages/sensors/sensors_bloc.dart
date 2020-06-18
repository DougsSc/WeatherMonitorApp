import 'package:weathermonitor/entitys/alert.dart';
import 'package:weathermonitor/entitys/sensor.dart';
import 'package:weathermonitor/pages/alerts/alerts_api.dart';
import 'package:weathermonitor/pages/sensors/sensors_api.dart';
import 'package:weathermonitor/utils/simple_bloc.dart';

class SensorsBloc extends SimpleBloc<List<Measure>> {

  fetch() async {
    try {
      add(await SensorsApi.measures());
    } catch(e) {
      print(e);
      addError(e);
    }
  }
}