import 'package:extensions_demonstration/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginInPage extends StatelessWidget {
  LoginInPage({super.key});
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var getStorageInstance = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Log In'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // getStorageInstance.write('isLoggedIn', true);
                  // getStorageInstance.write('Name', nameController.text);
                  // getStorageInstance.write('Password', passwordController.text);
                  // Get.offAll(HomePage());
                  getStorageInstance.erase();
                },
                child: const Text('Login'))
          ]),
        ));
  }
}
