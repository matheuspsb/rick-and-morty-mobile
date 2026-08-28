import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/app/app.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('RickMortyApp mounts and renders the archive header copy', (
    tester,
  ) async {
    await tester.pumpWidget(const RickMortyApp());
    await tester.pumpAndSettle();

    final l10n = await AppLocalizations.delegate.load(const Locale('pt'));
    expect(find.text(l10n.headerTitle), findsOneWidget);
  });
}
