import 'package:extensions_demonstration/main.dart';
import 'package:extensions_demonstration/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var getStorageInstance = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Center(
              child: ElevatedButton(
            child: const Text('Log Out'),
            onPressed: () {
              getStorageInstance.write('isLoggedIn', false);
              Get.offAll(LoginInPage());
            },
          )),
        ));
  }
}
