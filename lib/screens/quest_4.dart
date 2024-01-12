import 'package:flutter/material.dart';
import 'dart:convert';

class Quest4 extends StatefulWidget {
  @override
  _Quest4State createState() => _Quest4State();
}

class _Quest4State extends State<Quest4> {
  final String jsonString = '''
    {
      "restaurantId": "R101",
      "name": "Gourmet Bistro",
      "rating": 4.8,
      "currentlyOpen": true
    }
  ''';

  late Map<String, dynamic> data;
  bool showInformation = false;

  @override
  void initState() {
    super.initState();
    data = json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON Parsing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showInformation) ...[
              Text("Restaurant ID: ${data["restaurantId"]}"),
              Text("Name: ${data["name"]}"),
              Text("Bewertung: ${data["rating"]}"),
              Text(
                  "Derzeit geöffnet: ${data["currentlyOpen"] ? "Ja" : "Nein"}"),
            ],
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
}
