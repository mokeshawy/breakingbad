import '../../data/models/response/characters_response_dto.dart';

abstract class CharactersRepository {
  Future<CharactersResponseDto> getAllCharacters();
}
