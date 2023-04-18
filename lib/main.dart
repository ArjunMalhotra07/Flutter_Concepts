import 'package:extensions_demonstration/pages/api_call.dart';
import 'package:extensions_demonstration/pages/test_inherited_widget.dart';
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ApiCallPage()));
              },
              child: const Text('API PAGE')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyApp1()));
              },
              child: const Text('INHERITED WIDGET')),
        ],
      )),
    );
  }
}
