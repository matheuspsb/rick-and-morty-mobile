import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_gender.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';

part 'character.freezed.dart';

@freezed
abstract class CharacterLocation with _$CharacterLocation {
  const factory CharacterLocation({
    required String name,
    required String url,
  }) = _CharacterLocation;
}

@freezed
abstract class Character with _$Character {
  const Character._();

  const factory Character({
    required int id,
    required String name,
    required CharacterStatus status,
    required String species,
    required String type,
    required CharacterGender gender,
    required CharacterLocation origin,
    required CharacterLocation location,
    required String image,
    required List<String> episodeUrls,
  }) = _Character;

  int get episodeCount => episodeUrls.length;
}
