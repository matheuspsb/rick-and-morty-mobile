// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterLocationDto _$CharacterLocationDtoFromJson(
  Map<String, dynamic> json,
) => CharacterLocationDto(
  name: json['name'] as String,
  url: json['url'] as String,
);

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) => CharacterDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  type: json['type'] as String? ?? '',
  gender: json['gender'] as String,
  origin: CharacterLocationDto.fromJson(json['origin'] as Map<String, dynamic>),
  location: CharacterLocationDto.fromJson(
    json['location'] as Map<String, dynamic>,
  ),
  image: json['image'] as String,
  episode:
      (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
);
