import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/core/theme/archive_theme.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';

void main() {
  group('ArchiveTheme.light', () {
    final theme = ArchiveTheme.light;

    test('paints the scaffold with the archive paper background', () {
      expect(theme.scaffoldBackgroundColor, ArchiveTokens.bg);
    });

    test('registers the ArchiveColors extension', () {
      expect(theme.extension<ArchiveColors>(), isNotNull);
      expect(
        theme.extension<ArchiveColors>()!.statusAlive,
        ArchiveTokens.statusAlive,
      );
    });

    test('uses the display font for headline styles', () {
      expect(
        theme.textTheme.headlineMedium?.fontFamily,
        ArchiveTokens.fontDisplay,
      );
    });

    testWidgets('ArchiveColorsX resolves the extension from context', (
      tester,
    ) async {
      late ArchiveColors resolved;
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Builder(
            builder: (context) {
              resolved = context.archiveColors;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(resolved.line, ArchiveTokens.line);
    });
  });
}
