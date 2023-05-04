import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void isolateFunc(int finalNum) {
  int count = 0;
  for (int i = 0; i < finalNum; i++) {
    count++;
    if (count % 100 == 0) {
      debugPrint("Used 'Isolates.spawn' $count");
    }
  }
}

int _countUpTo(int finalNum) {
  int count = 0;
  for (int i = 0; i < finalNum; i++) {
    count++;
    if (count % 100 == 0) {
      debugPrint("Used 'Compute' $count");
    }
  }
  return count;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    Isolate.spawn(isolateFunc, 1000);
  }

  Future runCompute() async {
    _counter = await compute(_countUpTo, 1600);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text('$_counter'),
              ElevatedButton(
                onPressed: runCompute,
                child: const Text("Add in Isolate"),
              ),
            ],
          ),
        ));
  }
}
/* 
There are 2 ways to call an isolats : Isolates.spawn and compute function. Both takes in 2 arguments, a function and its param
 */