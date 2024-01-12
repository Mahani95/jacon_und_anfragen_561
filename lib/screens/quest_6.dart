import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Quest6 extends StatefulWidget {
  @override
  _Quest6State createState() => _Quest6State();
}

class _Quest6State extends State<Quest6> {
  String _data = "Noch keine Daten empfangen";
  bool _dataFetched = false;

  Future<void> fetchData() async {
    if (!_dataFetched) {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {
        setState(() {
          _data = json.decode(response.body).toString();
          _dataFetched = true;
        });
      } else {
        setState(() {
          _data = "Fehler beim Empfangen der Daten";
        });
      }
    } else {
      clearData();
    }
  }

  void clearData() {
    setState(() {
      _data = "Noch keine Daten empfangen";
      _dataFetched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Request"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: fetchData,
                child: Text(_dataFetched ? "Daten Löschen" : "Daten Abrufen"),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(_data),
            ],
          ),
        ),
      ),
    );
  }
}
