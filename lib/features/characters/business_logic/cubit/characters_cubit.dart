import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/response/characters_response_dto.dart';
import '../../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late CharactersResponseDto response;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  CharactersResponseDto getAllCharacters() {
    charactersRepository.getAllCharacters().then((charactersResponseDto) {
      emit(CharactersLoaded(charactersResponseDto));
      response = charactersResponseDto;
    });
    return response;
  }
}
