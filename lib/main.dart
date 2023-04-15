import 'package:extensions_demonstration/home_page.dart';
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

extension BetterStrings on String {
  String get firstTwoCharacters => substring(0, 2);
}

extension BetterIntegers on int {
  int get addFifty => this + 50;
}
