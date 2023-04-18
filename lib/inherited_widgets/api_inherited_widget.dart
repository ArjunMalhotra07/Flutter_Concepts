import 'package:flutter/material.dart';

import '../models/model.dart';

class ApiCallIW extends InheritedWidget {
  final ApiModel incomingBody;
  ApiCallIW({Key? key, required this.incomingBody, required this.child})
      : super(key: key, child: child);

  final Widget child;

  static ApiCallIW of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiCallIW>()!;
  }

  @override
  bool updateShouldNotify(ApiCallIW oldWidget) {
    return true;
  }
}
