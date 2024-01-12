import 'dart:convert';

import 'package:flutter/material.dart';

class Quest5 extends StatefulWidget {
  @override
  _Quest5State createState() => _Quest5State();
}

class _Quest5State extends State<Quest5> {
  final String jsonString = '''
    [
      {
        "city": {
          "name": "Springfield",
          "latitudeLongitude": "38.789304, -77.187203"
        },
        "temperature": 23,
        "humidity": 50,
        "forecast": [
          "Sunny",
          "Cloudy",
          "Rain"
        ]
      }
    ]
  ''';

  late List<dynamic> weatherData;
  bool showInformation = false;

  @override
  void initState() {
    super.initState();
    weatherData = json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showInformation) buildWeatherInfo(),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showInformation = !showInformation;
                });
              },
              child: Text(showInformation ? "Verbergen" : "Anzeigen"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWeatherInfo() {
    var cityInfo = weatherData[0]["city"];
    var forecastList = weatherData[0]["forecast"] as List;

    return Column(
      children: <Widget>[
        Text("Stadt: ${cityInfo["name"]}"),
        Text("Koordinaten: ${cityInfo["latitudeLongitude"]}"),
        Text("Temperatur: ${weatherData[0]["temperature"]}°C"),
        Text("Luftfeuchtigkeit: ${weatherData[0]["humidity"]}%"),
        Text("Vorhersage:"),
        ...forecastList.map((item) => Text(item)).toList(),
      ],
    );
  }
}
