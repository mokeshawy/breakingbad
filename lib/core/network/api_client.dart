

import 'package:dio/dio.dart';

abstract class ApiClint{

  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options
      });
}