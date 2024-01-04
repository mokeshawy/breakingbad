import 'package:bloc/bloc.dart';
import 'package:breakingbad/characters/data/models/response/characters_response_dto.dart';
import 'package:breakingbad/characters/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharcatersRepository charcatersRepository;
  late ChractersResponseDto response;

  CharactersCubit(this.charcatersRepository) : super(CharactersInitial());

  ChractersResponseDto getAllCharacters() {
    charcatersRepository.getAllCharacters().then((chractersResponseDto) {
      emit(CharactersLoaded(chractersResponseDto));
      response = chractersResponseDto;
    });
    return response;
  }
}
