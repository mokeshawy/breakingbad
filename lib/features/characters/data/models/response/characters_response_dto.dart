import 'package:freezed_annotation/freezed_annotation.dart';
part 'characters_response_dto.freezed.dart';
part 'characters_response_dto.g.dart';

@freezed
class CharactersResponseDto with _$CharactersResponseDto {
  const factory CharactersResponseDto({Info? info, List<Results>? results}) =
  _CharactersResponseDto;

  factory CharactersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseDtoFromJson(json);
}

@freezed
class Info with _$Info {
  const factory Info({
    int? count,
    int? pages,
    String? next,
    int? prev
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}

@freezed
class Results with _$Results {
  const factory Results ({int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Origin? origin,
    Origin? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created}) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
}

@freezed
class Origin with _$Origin {
  const factory Origin({String? name,
    String? url}) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}
