import 'package:extensions_demonstration/screens/home.dart';
import 'package:extensions_demonstration/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var getInstance = GetStorage();
  @override
  void initState() {
    super.initState();
    getInstance.writeIfNull('isLoggedIn', false);
    Future.delayed(Duration.zero, () async {
      checkIfLoggedIn();
    });
  }

  checkIfLoggedIn() {
    bool isLoggedIn = getInstance.read('isLoggedIn');
    if (isLoggedIn == true) {
      Get.to(HomePage());
    } else {
      Get.to(LoginInPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
