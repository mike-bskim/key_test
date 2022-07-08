import 'package:flutter/material.dart';

class GlobalKeyTest extends StatefulWidget {
  const GlobalKeyTest({Key? key}) : super(key: key);

  @override
  State<GlobalKeyTest> createState() => _GlobalKeyTestState();
}

class _GlobalKeyTestState extends State<GlobalKeyTest> {
  // 다른 StatefulWidget 의 상태를 접근하기 위해서 GlobalKey 키를 이용해서 접근
  final counterKey = GlobalKey<CounterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global key'),
      ),
      body: Center(
        child: Counter(
          key: counterKey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // 다른 StatefulWidget 의 상태를 접근하기 위해서 GlobalKey 키를 이용해서 접근
          counterKey.currentState!.increment();
          debugPrint(counterKey.currentState!.count.toString());
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int count = 0;
  void increment() {
    setState(() {
      count++;
    });
    // debugPrint(count.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Count number: $count',
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
