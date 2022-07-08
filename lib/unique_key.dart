import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class UniqueKeyTest extends StatefulWidget {
  const UniqueKeyTest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UniqueKeyTestState();
}

class UniqueKeyTestState extends State<UniqueKeyTest> {

// key 를 주지않으면 2개의 변경결과를 rendering 시 매칭하지 못한다
  List<Widget> tiles = [
    StatefulColorfulTile(
      key: UniqueKey(),
    ),
    StatefulColorfulTile(
      key: UniqueKey(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Unique Key'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tiles,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.double_arrow_rounded),
          onPressed: () {
            swapTiles();
            flutterToast();
          }),
    );
  }

// 첫째 배열을 제거해서 그것을 2번째 배열에 넣는다
  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({Key? key}) : super(key: key);

  @override
  StatefulColorfulTileState createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor = getRandomColor();

  @override
  Widget build(BuildContext context) {
    debugPrint('StatefulColorfulTile.key :${widget.key}');
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

getRandomColor() {
  var r = Random();
  return Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255));
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: 'Color has been changed',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
