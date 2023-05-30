import 'package:extensions_demonstration/domain/domain_controller.dart';
import 'package:extensions_demonstration/domain/models/api_model.dart';
import 'package:extensions_demonstration/locator.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DummyApiModel instance = DummyApiModel();

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
            Text(instance.body.toString()),
            Text(instance.id.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //! Step 5 : Locate service with getit and call service
          DummyApiModel incomingJsonData;
          incomingJsonData =
              await locator.get<DomainController>().getNextJsonData();
          //! Step 6 : set state
          setState(() {
            instance = incomingJsonData;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
