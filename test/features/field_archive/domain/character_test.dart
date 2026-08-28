import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_gender.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';

void main() {
  group('CharacterStatus.fromApi', () {
    test('maps the known values case-insensitively', () {
      expect(CharacterStatus.fromApi('Alive'), CharacterStatus.alive);
      expect(CharacterStatus.fromApi('dead'), CharacterStatus.dead);
    });

    test('falls back to unknown for anything else', () {
      expect(CharacterStatus.fromApi('unknown'), CharacterStatus.unknown);
      expect(CharacterStatus.fromApi(''), CharacterStatus.unknown);
      expect(CharacterStatus.fromApi('???'), CharacterStatus.unknown);
    });
  });

  group('CharacterGender.fromApi', () {
    test('maps the known values case-insensitively', () {
      expect(CharacterGender.fromApi('Female'), CharacterGender.female);
      expect(CharacterGender.fromApi('MALE'), CharacterGender.male);
      expect(CharacterGender.fromApi('Genderless'), CharacterGender.genderless);
    });

    test('falls back to unknown for anything else', () {
      expect(CharacterGender.fromApi('unknown'), CharacterGender.unknown);
      expect(CharacterGender.fromApi('n/a'), CharacterGender.unknown);
    });
  });

  test('episodeCount reflects the number of episode urls', () {
    const character = Character(
      id: 1,
      name: 'Rick Sanchez',
      status: CharacterStatus.alive,
      species: 'Human',
      type: '',
      gender: CharacterGender.male,
      origin: CharacterLocation(name: 'Earth (C-137)', url: ''),
      location: CharacterLocation(name: 'Citadel of Ricks', url: ''),
      image: 'https://example.com/1.jpeg',
      episodeUrls: ['e/1', 'e/2', 'e/3'],
    );

    expect(character.episodeCount, 3);
  });
}
