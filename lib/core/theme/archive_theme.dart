import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';

abstract final class ArchiveTheme {
  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: ArchiveTokens.accent,
      onPrimary: ArchiveTokens.bg,
      secondary: ArchiveTokens.accent,
      surface: ArchiveTokens.panel,
      onSurface: ArchiveTokens.ink,
      error: ArchiveTokens.error400,
      outline: ArchiveTokens.line,
    );

    final base = ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: ArchiveTokens.bg,
      fontFamily: ArchiveTokens.fontSans,
      extensions: const [ArchiveColors.light],
    );

    return base.copyWith(
      textTheme: base.textTheme
          .copyWith(
            displayLarge: _display(38, FontWeight.w700),
            displayMedium: _display(25, FontWeight.w700),
            displaySmall: _display(22, FontWeight.w600),
            headlineMedium: _display(19, FontWeight.w600),
            headlineSmall: _display(17, FontWeight.w600),
            titleLarge: _display(15.5, FontWeight.w600),
            titleMedium: _display(14, FontWeight.w500),
            labelLarge: _mono(11, FontWeight.w500),
            labelMedium: _mono(10.5, FontWeight.w400),
            labelSmall: _mono(9, FontWeight.w400),
            bodyLarge: _sans(12.5, FontWeight.w400),
            bodyMedium: _sans(12.5, FontWeight.w400),
            bodySmall: _sans(11, FontWeight.w400),
          )
          .apply(bodyColor: ArchiveTokens.ink, displayColor: ArchiveTokens.ink),
      appBarTheme: const AppBarTheme(
        backgroundColor: ArchiveTokens.bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      dividerTheme: const DividerThemeData(
        color: ArchiveTokens.line,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static TextStyle _display(double size, FontWeight weight) => TextStyle(
    fontFamily: ArchiveTokens.fontDisplay,
    fontSize: size,
    fontWeight: weight,
    letterSpacing: size * 0.05,
    color: ArchiveTokens.ink,
  );

  static TextStyle _sans(double size, FontWeight weight) => TextStyle(
    fontFamily: ArchiveTokens.fontSans,
    fontSize: size,
    fontWeight: weight,
    color: ArchiveTokens.ink,
  );

  static TextStyle _mono(double size, FontWeight weight) => TextStyle(
    fontFamily: ArchiveTokens.fontMono,
    fontSize: size,
    fontWeight: weight,
    letterSpacing: size * 0.09,
    color: ArchiveTokens.ink,
  );
}
