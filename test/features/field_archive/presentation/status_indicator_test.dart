import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/status_indicator.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

import '../../../support/pump_app.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('pt'));
  });

  testWidgets('renders the localised label for each status', (tester) async {
    for (final (status, label) in [
      (CharacterStatus.alive, l10n.statusAlive),
      (CharacterStatus.dead, l10n.statusDead),
      (CharacterStatus.unknown, l10n.statusUnknown),
    ]) {
      await tester.pumpApp(StatusIndicator(status: status));
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('colours the dot by status', (tester) async {
    await tester.pumpApp(
      const StatusIndicator(status: CharacterStatus.alive),
    );

    final dot = tester.widget<Container>(
      find.descendant(
        of: find.byType(StatusIndicator),
        matching: find.byType(Container),
      ),
    );
    final decoration = dot.decoration! as BoxDecoration;
    expect(decoration.color, ArchiveTokens.statusAlive);
    expect(decoration.shape, BoxShape.circle);
  });
}
