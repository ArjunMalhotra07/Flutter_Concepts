import 'package:flutter/material.dart';

//! Define the InheritedWidget
class MyInheritedWidget extends InheritedWidget {
  final String info;
  final int counter;
  MyInheritedWidget(
      {Key? key,
      required Widget child,
      required this.info,
      required this.counter})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // Always notify the descendants when the info changes
    return info != oldWidget.info;
  }

  // Define a static method for easy access to the inherited widget
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }
}

//! Define the root widget that creates the InheritedWidget
class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      info: 'Hello, world!',
      counter: 599,
      child: Level1(),
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

    return Text(
        "$info My Age is ${MyInheritedWidget.of(context).counter} years");
  }
}
