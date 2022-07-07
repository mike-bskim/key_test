import 'package:flutter/material.dart';

import 'unique_key.dart';
import 'value_key.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ),
);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle elevatedButtonStyle =
    ElevatedButton.styleFrom(minimumSize: const Size(330.0, 40.0));

    // Divider divider = const Divider(
    //     height: 16, thickness: 1, indent: 16, endIndent: 16, color: Colors.grey);

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
            ElevatedButton(
              style: elevatedButtonStyle,
              child: Text("Value KEY 예제", style: textStyle),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ValueKeyTest(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
