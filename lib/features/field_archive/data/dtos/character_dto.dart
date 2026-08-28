import 'package:json_annotation/json_annotation.dart';

part 'character_dto.g.dart';

@JsonSerializable(createToJson: false)
class CharacterLocationDto {
  const CharacterLocationDto({required this.name, required this.url});

  factory CharacterLocationDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationDtoFromJson(json);

  final String name;
  final String url;
}

@JsonSerializable(createToJson: false)
class CharacterDto {
  const CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  final int id;
  final String name;
  final String status;
  final String species;

  @JsonKey(defaultValue: '')
  final String type;

  final String gender;
  final CharacterLocationDto origin;
  final CharacterLocationDto location;
  final String image;

  @JsonKey(defaultValue: <String>[])
  final List<String> episode;
}
