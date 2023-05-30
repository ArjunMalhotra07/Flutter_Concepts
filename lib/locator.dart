import 'package:extensions_demonstration/domain/domain_controller.dart';
import 'package:extensions_demonstration/repositories/api_call.dart';
import 'package:get_it/get_it.dart';

//! Step 2 : Creating get_it locator instance
final locator = GetIt.instance;
//! Step 3 : Creating setup Method and services
void setUp() {
  locator.registerLazySingleton<DomainController>(() => DomainController());
  locator.registerLazySingleton<APIs>(() => APIs());
}
