import 'package:flutter/material.dart';

final rootScaffoldKey = GlobalKey<ScaffoldMessengerState>();

class ScaffoldMessengerKeyTest extends StatelessWidget {
  const ScaffoldMessengerKeyTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Messenger'),
      ),
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.thumb_up),
        onPressed: () {
          rootScaffoldKey.currentState!.showSnackBar(
            SnackBar(
              content: const Text('I like a new SnackBar!!'),
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'undo',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdPage(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Go to the second page'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text(
          '"좋아요가 추가 되었습니다"',
          style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// 스택바를 보여주다가 페이지 이동시 바로 사라지게 하는 방법
// ScaffoldMessenger 를 추가하여 상위의 ScaffoldMessenger 와 다른 영역을 만들어 준 후,
// Builder 를 새로 만들어서 context 를 분리하면 된다.
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Third Page'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '"좋아요"를 취소 하시겠습니까?',
                  style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                ),
                ElevatedButton(
                  onPressed: () {
// ScaffoldMessenger 를 추가해서 상위의 ScaffoldMessenger 와 다른 영역을 만들었기 때문에
// rootScaffoldKey 로 접근하면 화면에서 빠져나온 후 해당 스낵바가 표시됨
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('"좋아요"가 취소되었습니다'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  child: const Text('취소하기'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
