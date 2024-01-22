

import '../../data/models/response/characters_response_dto.dart';

abstract class CharactersDataSource{
  Future<CharactersResponseDto> getAllCharacters();
}