import 'package:weathermonitor/entitys/alert.dart';
import 'package:weathermonitor/pages/alerts/alerts_api.dart';
import 'package:weathermonitor/utils/simple_bloc.dart';

class AlertsBloc extends SimpleBloc<List<Alert>> {

  fetch() async {
    try {
      add(await AlertApi.alerts());
    } catch(e) {
      print(e);
      addError(e);
    }
  }
}