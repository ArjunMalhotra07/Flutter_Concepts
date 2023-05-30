import 'dart:convert';
import 'dart:math';

import 'package:extensions_demonstration/domain/models/api_model.dart';
import 'package:http/http.dart' as http;

class APIs {
  Future<DummyApiModel> getDummyData() async {
    Random random = Random();
    int randomNumber = random.nextInt(100) + 1;
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$randomNumber'));
    final body = response.body;
    Map<String, dynamic> singleJson = jsonDecode(body);
    return DummyApiModel.fromJson(singleJson);
  }
}
