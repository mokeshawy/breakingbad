import 'package:breakingbad/characters/data/models/response/characters_response_dto.dart';
import 'package:breakingbad/characters/data/web_services/chracters_web_services.dart';

class CharcatersRepository {
  late CharactersWebServices charactersWebServices;

  CharcatersRepository(this.charactersWebServices);

  Future<ChractersResponseDto> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters;
  }
}
