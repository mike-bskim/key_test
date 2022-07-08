import 'package:flutter/material.dart';

import 'global_key.dart';
import 'scaffoldmessenger_key.dart';
import 'unique_key.dart';
import 'value_key.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    scaffoldMessengerKey: rootScaffoldKey,
    home: const Home(),
  ),
);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle elevatedButtonStyle =
    ElevatedButton.styleFrom(minimumSize: const Size(330.0, 40.0));

    Divider divider = const Divider(
        height: 16, thickness: 1, color: Colors.white);

    TextStyle textStyle = const TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('KEY'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: elevatedButtonStyle,
              child: Text("Unique KEY 예제", style: textStyle),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const UniqueKeyTest(),
                ));
              },
            ),
            divider,
            ElevatedButton(
              style: elevatedButtonStyle,
              child: Text("Value KEY 예제", style: textStyle),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ValueKeyTest(),
                ));
              },
            ),
            divider,
            ElevatedButton(
              style: elevatedButtonStyle,
              child: Text("Global KEY 예제", style: textStyle),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const GlobalKeyTest(),
                ));
              },
            ),
            divider,
            ElevatedButton(
              style: elevatedButtonStyle,
              child: Text("Scaffold Messenger KEY 예제", style: textStyle),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ScaffoldMessengerKeyTest(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
