import 'package:flutter/material.dart';
import 'package:jacon_und_anfragen_561/screens/quest_3.dart';
import 'package:jacon_und_anfragen_561/screens/quest_4.dart';
import 'package:jacon_und_anfragen_561/screens/quest_5.dart';
import 'package:jacon_und_anfragen_561/screens/quest_6.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SharedPreferences ',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aufgaben auswahl")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quest3()));
              },
              child: const Text("Aufgabe 3"),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quest4()));
              },
              child: const Text("Aufgabe 4"),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quest5()));
              },
              child: const Text("Aufgabe 5"),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quest6()));
              },
              child: const Text("Aufgabe 6"),
            ),
          ],
        ),
      ),
    );
  }
}
