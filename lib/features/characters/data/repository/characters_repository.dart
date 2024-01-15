
import '../models/response/characters_response_dto.dart';
import '../web_services/characters_web_services.dart';


class CharactersRepository {
  late CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<CharactersResponseDto> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters;
  }
}
