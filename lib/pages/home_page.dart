import 'package:flutter/material.dart';
import 'package:weathermonitor/pages/alerts/alerts_page.dart';
import 'package:weathermonitor/pages/sensors/sensors_page.dart';
import 'package:weathermonitor/utils/nav.dart';

import 'alerts/add_alert_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Weather Monitor'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.insert_chart)),
              Tab(icon: Icon(Icons.notifications_active))
            ],
          ),
        ),
        body: _body(),
        floatingActionButton: _floatActionButton(),
      ),
    );
  }

  _body() {
    return TabBarView(children: [
      SensorsPage(),
      AlertsPage(),
    ]);
  }

  _floatActionButton() {
    return Container(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(_scaffoldKey.currentState.context).viewPadding.bottom,
      ),
      child: FloatingActionButton(
        onPressed: _onClickAddAlert,
        child: Icon(Icons.add),
      ),
    );
  }

  _onClickAddAlert() {
    push(context, AddAlertPage());
  }
}
