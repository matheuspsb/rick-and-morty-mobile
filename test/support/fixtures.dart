import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_gender.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';

Map<String, dynamic> characterJsonFixture({
  int id = 1,
  String name = 'Rick Sanchez',
  String status = 'Alive',
  String species = 'Human',
  String type = '',
  String gender = 'Male',
  String originName = 'Earth (C-137)',
  String locationName = 'Citadel of Ricks',
  List<String> episode = const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
}) {
  return {
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'type': type,
    'gender': gender,
    'origin': {'name': originName, 'url': ''},
    'location': {'name': locationName, 'url': ''},
    'image': 'https://rickandmortyapi.com/api/character/avatar/$id.jpeg',
    'episode': episode,
    'url': 'https://rickandmortyapi.com/api/character/$id',
    'created': '2017-11-04T18:48:46.250Z',
  };
}

Character characterFixture({
  int id = 1,
  String name = 'Rick Sanchez',
  CharacterStatus status = CharacterStatus.alive,
  String species = 'Human',
  String type = '',
  CharacterGender gender = CharacterGender.male,
  String originName = 'Earth (C-137)',
  String locationName = 'Citadel of Ricks',
  List<String> episodeUrls = const ['e/1', 'e/2'],
}) {
  return Character(
    id: id,
    name: name,
    status: status,
    species: species,
    type: type,
    gender: gender,
    origin: CharacterLocation(name: originName, url: ''),
    location: CharacterLocation(name: locationName, url: ''),
    image: 'https://example.com/$id.jpeg',
    episodeUrls: episodeUrls,
  );
}
