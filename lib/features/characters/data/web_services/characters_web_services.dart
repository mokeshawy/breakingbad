import 'package:breakingbad/core/constans/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/response/characters_response_dto.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20 * 1000),
      receiveTimeout: const Duration(seconds: 20 * 1000),
    );
    dio = Dio(options);
  }

  Future<CharactersResponseDto> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      return CharactersResponseDto.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) print(e.toString());
      rethrow;
    }
  }
}
