import 'package:breakingbad/core/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/data_soruce/characters_data_soruce.dart';
import '../models/response/characters_response_dto.dart';

class CharactersDataSourceImpl implements CharactersDataSource {
  final ApiClint _apiClint;

  const CharactersDataSourceImpl(this._apiClint);

  @override
  Future<CharactersResponseDto> getAllCharacters() async {
    try {
      Response response = await _apiClint.get('character');
      return CharactersResponseDto.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) print(e.toString());
      rethrow;
    }
  }
}
