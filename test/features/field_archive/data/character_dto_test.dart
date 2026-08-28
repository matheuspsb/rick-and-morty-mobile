import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/features/field_archive/data/dtos/character_dto.dart';
import 'package:rick_morty_mobile/features/field_archive/data/dtos/character_mapper.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_gender.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';

import '../../../support/fixtures.dart';

void main() {
  group('CharacterDto.fromJson', () {
    test('reads the flat and nested fields', () {
      final dto = CharacterDto.fromJson(characterJsonFixture(id: 2));

      expect(dto.id, 2);
      expect(dto.name, 'Rick Sanchez');
      expect(dto.status, 'Alive');
      expect(dto.origin.name, 'Earth (C-137)');
      expect(dto.location.name, 'Citadel of Ricks');
      expect(dto.episode, hasLength(2));
    });

    test('defaults type and episode when absent', () {
      final json = characterJsonFixture()
        ..remove('type')
        ..remove('episode');

      final dto = CharacterDto.fromJson(json);

      expect(dto.type, '');
      expect(dto.episode, isEmpty);
    });
  });

  group('toDomain', () {
    test('maps stringly-typed status and gender to enums', () {
      final domain = CharacterDto.fromJson(
        characterJsonFixture(status: 'Dead', gender: 'Female'),
      ).toDomain();

      expect(domain.status, CharacterStatus.dead);
      expect(domain.gender, CharacterGender.female);
    });

    test('falls back to unknown for unrecognised values', () {
      final domain = CharacterDto.fromJson(
        characterJsonFixture(status: 'purgatory', gender: 'yes'),
      ).toDomain();

      expect(domain.status, CharacterStatus.unknown);
      expect(domain.gender, CharacterGender.unknown);
    });

    test('carries the episode urls and derives episodeCount', () {
      final domain = CharacterDto.fromJson(
        characterJsonFixture(episode: const ['e/1', 'e/2', 'e/3']),
      ).toDomain();

      expect(domain.episodeUrls, ['e/1', 'e/2', 'e/3']);
      expect(domain.episodeCount, 3);
    });
  });
}
