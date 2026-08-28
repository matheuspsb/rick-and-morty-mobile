import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/repositories/character_repository.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/usecases/get_characters_by_episodes.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';

import '../../../support/fixtures.dart';

class _MockCharacterRepository extends Mock implements CharacterRepository {}

class _FakeEpisodeQuery extends Fake implements EpisodeQuery {}

void main() {
  setUpAll(() => registerFallbackValue(_FakeEpisodeQuery()));

  late _MockCharacterRepository repository;
  late GetCharactersByEpisodes useCase;

  setUp(() {
    repository = _MockCharacterRepository();
    useCase = GetCharactersByEpisodes(repository);
  });

  test('parses the raw ids and delegates to the repository', () async {
    final characters = [characterFixture(), characterFixture(id: 2)];
    when(() => repository.charactersByEpisodes(any()))
        .thenAnswer((_) async => characters);

    final result = await useCase(' 10 , 28 ');

    expect(result, characters);
    final captured =
        verify(
              () => repository.charactersByEpisodes(captureAny()),
            ).captured.single
            as EpisodeQuery;
    expect(captured.ids, [10, 28]);
  });

  test(
    'throws InvalidInputFailure and skips the repository on bad input',
    () async {
      await expectLater(
        useCase('not-ids'),
        throwsA(isA<InvalidInputFailure>()),
      );
      verifyNever(() => repository.charactersByEpisodes(any()));
    },
  );

  test('propagates a Failure thrown by the repository', () async {
    when(() => repository.charactersByEpisodes(any()))
        .thenThrow(const ConnectionFailure());

    await expectLater(useCase('10'), throwsA(isA<ConnectionFailure>()));
  });
}
