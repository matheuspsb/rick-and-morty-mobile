import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/features/field_archive/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/repositories/character_repository.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/pages/character_detail_page.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/character_detail_view.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

import '../../../support/fixtures.dart';
import '../../../support/pump_app.dart';

class _MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  late _MockCharacterRepository repository;
  late AppLocalizations l10n;

  setUp(() async {
    repository = _MockCharacterRepository();
    l10n = await AppLocalizations.delegate.load(const Locale('pt'));
  });

  Future<void> pumpPage(WidgetTester tester, Widget page) => tester.pumpApp(
    page,
    overrides: [characterRepositoryProvider.overrideWithValue(repository)],
  );

  testWidgets(
    'renders the preloaded character without hitting the repository',
    (
      tester,
    ) async {
      await pumpPage(
        tester,
        CharacterDetailPage(
          characterId: 1,
          character: characterFixture(name: 'Morty Smith'),
        ),
      );

      expect(find.byType(CharacterDetailView), findsOneWidget);
      expect(find.text('MORTY SMITH'), findsOneWidget);
      verifyNever(() => repository.characterById(any()));
    },
  );

  testWidgets('fetches by id when no character is passed', (tester) async {
    final completer = Completer<Character>();
    when(
      () => repository.characterById(42),
    ).thenAnswer((_) => completer.future);

    await pumpPage(tester, const CharacterDetailPage(characterId: 42));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    completer.complete(characterFixture(id: 42, name: 'Summer Smith'));
    await tester.pumpAndSettle();

    expect(find.text('SUMMER SMITH'), findsOneWidget);
  });

  testWidgets('shows the character-not-found state on a 404', (tester) async {
    when(
      () => repository.characterById(any()),
    ).thenThrow(const NotFoundFailure());

    await pumpPage(tester, const CharacterDetailPage(characterId: 999));
    await tester.pumpAndSettle();

    expect(find.text(l10n.characterNotFoundTitle), findsOneWidget);
    expect(find.text(l10n.retry), findsOneWidget);
  });

  testWidgets('falls back to the connection error on other failures', (
    tester,
  ) async {
    when(
      () => repository.characterById(any()),
    ).thenThrow(const ConnectionFailure());

    await pumpPage(tester, const CharacterDetailPage(characterId: 1));
    await tester.pumpAndSettle();

    expect(find.text(l10n.connectionErrorTitle), findsOneWidget);
  });
}
