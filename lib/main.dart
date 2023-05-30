import 'package:extensions_demonstration/locator.dart';
import 'package:extensions_demonstration/view/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  //! Step 4 : Call setup method to initialize services
  setUp();
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
