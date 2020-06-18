class Measure {
  double temperature;
  double airMoisture;
  double luminosity;

  Measure({this.temperature, this.airMoisture, this.luminosity});

  Measure.fromMap(Map<String, dynamic> map) {
    temperature = map['temperature'];
    airMoisture = map['air_moisture'];
    luminosity = map['luminosity'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['air_moisture'] = this.airMoisture;
    data['luminosity'] = this.luminosity;
    return data;
  }
}