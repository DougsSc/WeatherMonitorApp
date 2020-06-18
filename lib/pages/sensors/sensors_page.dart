import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weathermonitor/entitys/sensor.dart';
import 'package:weathermonitor/pages/sensors/sensors_bloc.dart';
import 'package:weathermonitor/widgets/label.dart';

class SensorsPage extends StatefulWidget {
  @override
  _SensorsPageState createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  List<Measure> sensors;

  final _bloc = SensorsBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<List<Measure>>(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text('Não foi possível buscar os dados'));
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            sensors = snapshot.data;
            return _listView(snapshot.data);
          }),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  _listView(List<Measure> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final measure = data[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              _alertItem(alert),
            _measureItem(measure),
              Divider(),
            ],
          ),
        );
      },
    );
  }

  _getIcon(String type) {
    if (type == 'air_moisture') {
      return Icon(Icons.opacity, color: Colors.blueAccent, size: 20);
    } else if (type == 'luminosity') {
      return Icon(Icons.wb_sunny, color: Colors.yellow[700], size: 20);
    } else if (type == 'temperature') {
      return Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.thermometerHalf,
            size: 20,
            color: Colors.red,
          ),
        ),
      );
    }
    return Icon(Icons.opacity);
  }

  _measureItem(Measure measure) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getIcon("temperature"),
              SizedBox(width: 16),
              Label('${measure.temperature} ºC'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getIcon("air_moisture"),
              SizedBox(width: 6),
              Label('${measure.airMoisture} %'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getIcon("luminosity"),
              SizedBox(width: 16),
              Label('${measure.luminosity} %'),
            ],
          ),
        ],
      ),
    );
  }
}
