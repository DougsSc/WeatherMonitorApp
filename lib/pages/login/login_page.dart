import 'package:flutter/material.dart';
import 'package:weathermonitor/pages/home_page.dart';
import 'package:weathermonitor/pages/login/login_bloc.dart';
import 'package:weathermonitor/utils/alert.dart';
import 'package:weathermonitor/utils/api_response.dart';
import 'package:weathermonitor/utils/nav.dart';
import 'package:weathermonitor/widgets/button.dart';
import 'package:weathermonitor/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _loginC = TextEditingController(text: "douglas.schneider20@gmail.com");
  final _passwordC = TextEditingController(text: "teste@123");

  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      key: _scaffoldKey,
      appBar: AppBar(centerTitle: true, title: Text("WM Login")),
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            DefaultTextField('Login', controller: _loginC),
            SizedBox(height: 16),
            DefaultTextField('Senha', controller: _passwordC, password: true),
            SizedBox(height: 32),
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {
                var loader = snapshot.data;
                if (snapshot.hasError) loader = false;
                return DefaultButton(
                  'Acessar',
                  showProgress: loader,
                  onPressed: loader
                      ? null
                      : _login,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _login() async {
    ApiResponse response = await _bloc.login(_loginC.text, _passwordC.text);
    if (response.ok) {
      pushReplacement(context, HomePage());
    } else {
//      showSnackBar(_scaffoldKey.currentState, response.result);
    }
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
