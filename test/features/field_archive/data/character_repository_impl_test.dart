import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/core/network/api_exception.dart';
import 'package:rick_morty_mobile/features/field_archive/data/datasources/character_remote_data_source.dart';
import 'package:rick_morty_mobile/features/field_archive/data/dtos/character_dto.dart';
import 'package:rick_morty_mobile/features/field_archive/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';

import '../../../support/fixtures.dart';

class _MockRemoteDataSource extends Mock implements CharacterRemoteDataSource {}

void main() {
  late _MockRemoteDataSource remote;
  late CharacterRepositoryImpl repository;

  setUp(() {
    remote = _MockRemoteDataSource();
    repository = CharacterRepositoryImpl(remote);
  });

  final query = EpisodeQuery.tryParse('10,28')!;

  group('charactersByEpisodes', () {
    test('passes the path segment and maps dtos to entities', () async {
      when(() => remote.charactersByEpisodes('10,28')).thenAnswer(
        (_) async => [
          CharacterDto.fromJson(characterJsonFixture(status: 'Dead')),
        ],
      );

      final result = await repository.charactersByEpisodes(query);

      expect(result.single.status, CharacterStatus.dead);
    });

    test('translates ApiException(400) into InvalidInputFailure', () async {
      when(() => remote.charactersByEpisodes(any())).thenThrow(
        const ApiException(message: 'bad', statusCode: 400),
      );

      await expectLater(
        repository.charactersByEpisodes(query),
        throwsA(isA<InvalidInputFailure>()),
      );
    });

    test('translates ApiException(404) into NotFoundFailure', () async {
      when(() => remote.charactersByEpisodes(any())).thenThrow(
        const ApiException(message: 'missing', statusCode: 404),
      );

      await expectLater(
        repository.charactersByEpisodes(query),
        throwsA(isA<NotFoundFailure>()),
      );
    });

    test(
      'translates a connection ApiException into ConnectionFailure',
      () async {
        when(() => remote.charactersByEpisodes(any())).thenThrow(
          const ApiException(message: 'offline'),
        );

        await expectLater(
          repository.charactersByEpisodes(query),
          throwsA(isA<ConnectionFailure>()),
        );
      },
    );
  });

  group('characterById', () {
    test('maps the dto to an entity', () async {
      when(() => remote.characterById(1)).thenAnswer(
        (_) async => CharacterDto.fromJson(characterJsonFixture()),
      );

      final result = await repository.characterById(1);

      expect(result.name, 'Rick Sanchez');
    });

    test('translates an unexpected status into UnknownFailure', () async {
      when(() => remote.characterById(any())).thenThrow(
        const ApiException(message: 'boom', statusCode: 500),
      );

      await expectLater(
        repository.characterById(1),
        throwsA(isA<UnknownFailure>()),
      );
    });
  });
}
