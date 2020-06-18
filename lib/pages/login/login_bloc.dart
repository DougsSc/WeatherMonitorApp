import 'package:weathermonitor/pages/login/login_api.dart';
import 'package:weathermonitor/utils/api_response.dart';
import 'package:weathermonitor/utils/simple_bloc.dart';

class LoginBloc extends SimpleBloc<bool> {

  login(email, password) async {
    add(true);

    try {
      ApiResponse response = await LoginApi.login(email, password);
      add(false);
      return response;
    } catch (e) {
      addError(e);
    }
  }
}
