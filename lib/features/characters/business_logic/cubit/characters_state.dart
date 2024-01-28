part of 'characters_cubit.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  @override
  List<Object?> get props => [];
}

class CharactersInitial extends CharactersState {
  const CharactersInitial();
}

class CharactersLoaded extends CharactersState {
  final CharactersResponseDto charactersResponseDto;

  const CharactersLoaded(this.charactersResponseDto);

  @override
  List<Object?> get props => [charactersResponseDto];
}
