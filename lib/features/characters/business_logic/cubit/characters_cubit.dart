import 'package:bloc/bloc.dart';
import 'package:breakingbad/features/characters/domain/use_case/characters_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/response/characters_response_dto.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersUseCase charactersUseCase;

  CharactersCubit(this.charactersUseCase) : super(const CharactersInitial());

  void getAllCharacters() {
    charactersUseCase().then((charactersResponseDto) {
      emit(CharactersLoaded(charactersResponseDto));
    });
  }
}
