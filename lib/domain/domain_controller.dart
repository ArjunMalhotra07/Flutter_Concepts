import 'package:extensions_demonstration/domain/models/api_model.dart';
import 'package:extensions_demonstration/repositories/api_call.dart';

import '../locator.dart';

class DomainController {
  Future<DummyApiModel> getNextJsonData() async {
    return locator.get<APIs>().getDummyData();
  }
}
