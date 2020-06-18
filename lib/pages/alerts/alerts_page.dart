import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weathermonitor/entitys/alert.dart';
import 'package:weathermonitor/pages/alerts/alerts_bloc.dart';

class AlertsPage extends StatefulWidget {
  @override
  _AlertsPageState createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  List<Alert> alerts;

  final _bloc = AlertsBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<List<Alert>>(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text('Não foi possível buscar os dados'));
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            alerts = snapshot.data;
            return _listView(snapshot.data);
          }),
    );
  }

  _getIcon(String type) {
    if (type == 'air_moisture') {
      return Icon(Icons.opacity, color: Colors.blueAccent, size: 40);
    } else if (type == 'luminosity') {
      return Icon(Icons.wb_sunny, color: Colors.yellow[700], size: 40);
    } else if (type == 'temperature') {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: FaIcon(
          FontAwesomeIcons.thermometerHalf,
          size: 40,
          color: Colors.red,
        ),
      );
    }
    return Icon(Icons.opacity);
  }

  _alertItem(Alert alert) {
    String subtitle = '${alert.rule.condition} ${alert.rule.value}';

    return ListTile(
      title: Text(alert.title),
      subtitle: Text(subtitle),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_getIcon(alert.rule.measure)],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.blueGrey,
        ),
        iconSize: 20,
        onPressed: () {},
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  _listView(List<Alert> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final alert = data[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _alertItem(alert),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
