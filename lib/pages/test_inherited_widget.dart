import 'package:extensions_demonstration/inherited_widgets/my_inherited_widget.dart';
import 'package:extensions_demonstration/pages/api_call.dart';
import 'package:flutter/material.dart';

//! Define the root widget that creates the InheritedWidget
class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyInheritedWidget(
          info: 'Hello, world!',
          counter: 599,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Level2()],
          ),
        ),
      ),
    );
  }
}

// Define the descendant widgets that pass the info down
class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level4(),
    );
  }
}

class Level4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level5(),
    );
  }
}

class Level5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyWidget();
  }
}

//! Define a widget that uses the InheritedWidget
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the info from the inherited widget
    final info = MyInheritedWidget.of(context).info;

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
          "This is a widget thats 5 widgets down the tree that fetches data from inherited widget named  `MyInheritedWidget` \nINFO -> $info COUNTER -> ${MyInheritedWidget.of(context).counter}"),
    );
  }
}
