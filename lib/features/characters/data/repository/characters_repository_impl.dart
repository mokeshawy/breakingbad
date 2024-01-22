import 'package:breakingbad/features/characters/domain/repository/characters_repository.dart';

import '../../domain/data_soruce/characters_data_soruce.dart';
import '../models/response/characters_response_dto.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  late CharactersDataSource charactersDataSource;

  CharactersRepositoryImpl(this.charactersDataSource);

  @override
  Future<CharactersResponseDto> getAllCharacters() async {
    final characters = await charactersDataSource.getAllCharacters();
    return characters;
  }
}
