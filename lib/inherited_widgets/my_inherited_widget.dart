//! Define the InheritedWidget
import 'package:flutter/material.dart';

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
