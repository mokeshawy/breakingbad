import 'package:breakingbad/core/network/api_client.dart';
import 'package:dio/dio.dart';

import '../constans/strings.dart';

class DioClint implements ApiClint {
  final Dio _dio;

  DioClint(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20 * 1000),
      receiveTimeout: const Duration(seconds: 20 * 1000),
    );
  }

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParameters, options: options);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
