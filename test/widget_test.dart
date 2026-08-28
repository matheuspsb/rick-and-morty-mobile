import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/app/app.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/pages/field_archive_page.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('app boots into the Field Archive route', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: RickMortyApp()));
    await tester.pumpAndSettle();

    final l10n = await AppLocalizations.delegate.load(const Locale('pt'));

    expect(find.byType(FieldArchivePage), findsOneWidget);
    expect(find.text(l10n.headerTitle), findsOneWidget);
  });
}
