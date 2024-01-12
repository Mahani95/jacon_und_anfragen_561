import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Quest3 extends StatefulWidget {
  const Quest3({super.key});

  @override
  _Quest3State createState() => _Quest3State();
}

class _Quest3State extends State<Quest3> {
  bool _value = false;

  _saveValue(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("bool", value);
    setState(() {
      _value = value;
    });
  }

  _readValue() async {
    final prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool("bool") ?? false;
    setState(() {
      _value = value;
    });
  }

  _deleteValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("bool");
    setState(() {
      _value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Wert ist $_value"),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () => _saveValue(true),
              child: const Text("Speichern"),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: _readValue,
              child: const Text("Auslesen"),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: _deleteValue,
              child: const Text("Löschen"),
            ),
          ],
        ),
      ),
    );
  }
}
