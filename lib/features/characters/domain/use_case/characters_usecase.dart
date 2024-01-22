import 'package:breakingbad/features/characters/domain/repository/characters_repository.dart';

import '../../data/models/response/characters_response_dto.dart';

class CharactersUseCase {
  final CharactersRepository charactersRepository;

  CharactersUseCase(this.charactersRepository);

  Future<CharactersResponseDto> call() async {
    final response = await charactersRepository.getAllCharacters();
    return response;
  }
}
