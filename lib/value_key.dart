import 'package:flutter/material.dart';

class ValueKeyTest extends StatefulWidget {
  const ValueKeyTest({Key? key}) : super(key: key);

  @override
  ValueKeyTestState createState() => ValueKeyTestState();
}

class ValueKeyTestState extends State<ValueKeyTest> {
  bool emailField = true;
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Key'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (emailField)
                const TextField(
                  key: ValueKey(1),
                  // controller 를 사용하면 key 를 사용한 것과 동일한 결과임
                  // controller: idController,
                  decoration: InputDecoration(labelText: 'Enter "dice"'),
                  keyboardType: TextInputType.emailAddress,
                ),
              const TextField(
                key: ValueKey(2),
                // controller 를 사용하면 key 를 사용한 것과 동일한 결과임
                // controller: pwController,
                decoration: InputDecoration(labelText: 'Enter Password'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 40.0,
              ),
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                  ),
                  // color:
                  child: const Icon(
                    Icons.visibility_off,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  onPressed: () {
                    setState(() {
                      emailField = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
