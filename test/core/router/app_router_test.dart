import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/router/app_router.dart';
import 'package:rick_morty_mobile/core/router/routes.dart';
import 'package:rick_morty_mobile/core/theme/archive_theme.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/pages/character_detail_page.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/pages/field_archive_page.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

import '../../support/fixtures.dart';

Future<ProviderContainer> _pumpRouter(WidgetTester tester) async {
  final container = ProviderContainer();
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp.router(
        routerConfig: container.read(goRouterProvider),
        theme: ArchiveTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}

void main() {
  testWidgets('starts at the archive route', (tester) async {
    await _pumpRouter(tester);

    expect(find.byType(FieldArchivePage), findsOneWidget);
  });

  testWidgets('navigates to the character detail route by id', (tester) async {
    final container = await _pumpRouter(tester);

    container.read(goRouterProvider).go(Routes.characterDetailLocation(42));
    await tester.pumpAndSettle();

    final page = tester.widget<CharacterDetailPage>(
      find.byType(CharacterDetailPage),
    );
    expect(page.characterId, 42);
  });

  testWidgets('forwards a Character passed as go extra', (tester) async {
    final container = await _pumpRouter(tester);
    final character = characterFixture(id: 5, name: 'Beth Smith');

    container
        .read(goRouterProvider)
        .go(Routes.characterDetailLocation(5), extra: character);
    await tester.pumpAndSettle();

    final page = tester.widget<CharacterDetailPage>(
      find.byType(CharacterDetailPage),
    );
    expect(page.character, character);
  });
}
