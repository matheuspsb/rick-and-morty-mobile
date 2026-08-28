import 'package:rick_morty_mobile/features/field_archive/data/dtos/character_dto.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_gender.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';

extension CharacterDtoMapper on CharacterDto {
  Character toDomain() => Character(
    id: id,
    name: name,
    status: CharacterStatus.fromApi(status),
    species: species,
    type: type,
    gender: CharacterGender.fromApi(gender),
    origin: origin.toDomain(),
    location: location.toDomain(),
    image: image,
    episodeUrls: List.unmodifiable(episode),
  );
}

extension CharacterLocationDtoMapper on CharacterLocationDto {
  CharacterLocation toDomain() => CharacterLocation(name: name, url: url);
}
