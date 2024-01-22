import 'package:breakingbad/core/network/api_client.dart';
import 'package:breakingbad/core/services_locator/services_locator.dart';
import 'package:dio/dio.dart';

import '../network/dio_clint.dart';

Future<void> setUpCoreDependencies() async {
  // ApiClint Dependencies
  servicesLocator.registerLazySingleton(() => Dio());
  servicesLocator
      .registerLazySingleton<ApiClint>(() => DioClint(servicesLocator()));
}
