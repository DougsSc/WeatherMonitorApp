import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weathermonitor/widgets/button.dart';
import 'package:weathermonitor/widgets/label.dart';
import 'package:weathermonitor/widgets/text_field.dart';

class AddAlertPage extends StatefulWidget {
  @override
  _AddAlertState createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlertPage> {
  final _titleC = TextEditingController();
  final _valueC = TextEditingController();

  int _type = 0;
  int _condition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      key: _scaffoldKey,
      appBar: AppBar(centerTitle: true, title: Text("Adicionar alerta")),
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: DefaultTextField('Título', controller: _titleC),
                ),
                SizedBox(height: 16),
                Label('Selecione o tipo de alerta:'),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickType(1),
                          child: Container(
                            color: _type == 1 ? Colors.grey[300] : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Icon(
                              Icons.opacity,
                              color: Colors.blueAccent,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickType(2),
                          child: Container(
                            color: _type == 2 ? Colors.grey[300] : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Icon(
                              Icons.wb_sunny,
                              color: Colors.yellow[700],
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickType(3),
                          child: Container(
                            color: _type == 3 ? Colors.grey[300] : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.thermometerHalf,
                                size: 40,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Label('Selecione a condição:'),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickCondition(1),
                          child: Container(
                            color: _condition == 1
                                ? Colors.grey[300]
                                : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.equals,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickCondition(2),
                          child: Container(
                            color: _condition == 2
                                ? Colors.grey[300]
                                : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.chevronLeft,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickCondition(3),
                          child: Container(
                            color: _condition == 3
                                ? Colors.grey[300]
                                : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.chevronLeft,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 4),
                                FaIcon(
                                  FontAwesomeIcons.equals,
                                  color: Colors.red,
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickCondition(4),
                          child: Container(
                            color: _condition == 4
                                ? Colors.grey[300]
                                : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.notEqual,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickCondition(5),
                          child: Container(
                            color: _condition == 5
                                ? Colors.grey[300]
                                : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.chevronRight,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: GestureDetector(
                          onTap: () => _onClickCondition(6),
                          child: Container(
                            color: _condition == 6
                                ? Colors.grey[300]
                                : Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.equals,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 4),
                                FaIcon(
                                  FontAwesomeIcons.chevronRight,
                                  color: Colors.red,
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  width: 150,
                  child: DefaultTextField(
                    'Valor',
                    controller: _valueC,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    Expanded(child: DefaultButton('Salvar')),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _onClickType(int type) {
    setState(() {
      _type = type;
    });
  }

  _onClickCondition(int condition) {
    setState(() {
      _condition = condition;
    });
  }
}
