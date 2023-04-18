import 'dart:convert';

import 'package:extensions_demonstration/models/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../inherited_widgets/api_inherited_widget.dart';

class ApiCallPage extends StatefulWidget {
  const ApiCallPage({super.key});

  @override
  State<ApiCallPage> createState() => _ApiCallPageState();
}

class _ApiCallPageState extends State<ApiCallPage> {
  late ApiModel incomingBody = ApiModel(
      page: 0,
      perPage: 0,
      total: 0,
      totalPages: 0,
      data: [],
      support: Support(text: '', url: ''));
  apiCallFunc() async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=/2'));
    var body = json.decode(response.body);
    setState(() {
      incomingBody = ApiModel.fromJson(body);
    });
  }

  @override
  void initState() {
    apiCallFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('API CALL'),
        ),
        body: ApiCallIW(
            incomingBody: incomingBody,
            child: ListView.builder(
              itemCount: incomingBody.data.length,
              itemBuilder: ((context, index) {
                final avatar =
                    ApiCallIW.of(context).incomingBody.data[index].avatar;
                final secondName =
                    ApiCallIW.of(context).incomingBody.data[index].lastName;
                return ListTile(
                  leading: Image.network(avatar),
                  title: Text(secondName),
                );
              }),
            )));
  }
}
