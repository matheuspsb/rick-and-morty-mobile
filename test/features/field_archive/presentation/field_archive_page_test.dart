import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/features/field_archive/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/repositories/character_repository.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/pages/field_archive_page.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_card.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_card_skeleton.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

import '../../../support/fixtures.dart';
import '../../../support/pump_app.dart';

class _MockCharacterRepository extends Mock implements CharacterRepository {}

class _FakeEpisodeQuery extends Fake implements EpisodeQuery {}

void main() {
  setUpAll(() => registerFallbackValue(_FakeEpisodeQuery()));

  late _MockCharacterRepository repository;
  late AppLocalizations l10n;

  setUp(() async {
    repository = _MockCharacterRepository();
    l10n = await AppLocalizations.delegate.load(const Locale('pt'));
  });

  Future<void> pumpPage(WidgetTester tester) => tester.pumpApp(
    const FieldArchivePage(),
    overrides: [characterRepositoryProvider.overrideWithValue(repository)],
  );

  Future<void> submit(WidgetTester tester, String text) async {
    await tester.enterText(find.byType(TextField), text);
    await tester.tap(find.text(l10n.querySubmit));
  }

  testWidgets('shows the empty archive state before any query', (tester) async {
    await pumpPage(tester);

    expect(find.text(l10n.emptyArchiveTitle), findsOneWidget);
  });

  testWidgets('renders a loading grid then the results', (tester) async {
    when(() => repository.charactersByEpisodes(any())).thenAnswer(
      (_) async => [characterFixture(), characterFixture(id: 2)],
    );

    await pumpPage(tester);
    await submit(tester, '10,28');
    await tester.pump();

    expect(find.byType(EntityCardSkeleton), findsWidgets);

    await tester.pumpAndSettle();

    expect(find.byType(EntityCard), findsNWidgets(2));
    expect(find.text(l10n.summaryObservedCount(2)), findsOneWidget);
  });

  testWidgets('shows the connection error state with a retry action', (
    tester,
  ) async {
    when(
      () => repository.charactersByEpisodes(any()),
    ).thenThrow(const ConnectionFailure());

    await pumpPage(tester);
    await submit(tester, '10');
    await tester.pumpAndSettle();

    expect(find.text(l10n.connectionErrorTitle), findsOneWidget);
    expect(find.text(l10n.retry), findsOneWidget);
  });

  testWidgets('rejects invalid input inline without calling the repository', (
    tester,
  ) async {
    await pumpPage(tester);
    await submit(tester, ',');
    await tester.pump();

    expect(find.text(l10n.invalidEpisodeIdsDescription), findsOneWidget);
    expect(find.byType(EntityCardSkeleton), findsNothing);
    verifyNever(() => repository.charactersByEpisodes(any()));
  });
}
