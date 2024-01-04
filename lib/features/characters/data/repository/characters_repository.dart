
import '../models/response/characters_response_dto.dart';
import '../web_services/chracters_web_services.dart';

class CharactersRepository {
  late CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<ChractersResponseDto> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters;
  }
}
