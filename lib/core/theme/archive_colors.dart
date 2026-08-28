import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';

@immutable
class ArchiveColors extends ThemeExtension<ArchiveColors> {
  const ArchiveColors({
    required this.panel,
    required this.texture,
    required this.line,
    required this.muted,
    required this.neutral,
    required this.accent,
    required this.statusAlive,
    required this.statusDead,
    required this.statusUnknown,
    required this.invalidInput,
    required this.notFound,
  });

  final Color panel;
  final Color texture;
  final Color line;
  final Color muted;
  final Color neutral;
  final Color accent;
  final Color statusAlive;
  final Color statusDead;
  final Color statusUnknown;
  final Color invalidInput;
  final Color notFound;

  static const light = ArchiveColors(
    panel: ArchiveTokens.panel,
    texture: ArchiveTokens.texture,
    line: ArchiveTokens.line,
    muted: ArchiveTokens.muted,
    neutral: ArchiveTokens.neutral,
    accent: ArchiveTokens.accent,
    statusAlive: ArchiveTokens.statusAlive,
    statusDead: ArchiveTokens.statusDead,
    statusUnknown: ArchiveTokens.statusUnknown,
    invalidInput: ArchiveTokens.error400,
    notFound: ArchiveTokens.error404,
  );

  @override
  ArchiveColors copyWith({
    Color? panel,
    Color? texture,
    Color? line,
    Color? muted,
    Color? neutral,
    Color? accent,
    Color? statusAlive,
    Color? statusDead,
    Color? statusUnknown,
    Color? invalidInput,
    Color? notFound,
  }) {
    return ArchiveColors(
      panel: panel ?? this.panel,
      texture: texture ?? this.texture,
      line: line ?? this.line,
      muted: muted ?? this.muted,
      neutral: neutral ?? this.neutral,
      accent: accent ?? this.accent,
      statusAlive: statusAlive ?? this.statusAlive,
      statusDead: statusDead ?? this.statusDead,
      statusUnknown: statusUnknown ?? this.statusUnknown,
      invalidInput: invalidInput ?? this.invalidInput,
      notFound: notFound ?? this.notFound,
    );
  }

  @override
  ArchiveColors lerp(ArchiveColors? other, double t) {
    if (other == null) return this;
    return ArchiveColors(
      panel: Color.lerp(panel, other.panel, t)!,
      texture: Color.lerp(texture, other.texture, t)!,
      line: Color.lerp(line, other.line, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      statusAlive: Color.lerp(statusAlive, other.statusAlive, t)!,
      statusDead: Color.lerp(statusDead, other.statusDead, t)!,
      statusUnknown: Color.lerp(statusUnknown, other.statusUnknown, t)!,
      invalidInput: Color.lerp(invalidInput, other.invalidInput, t)!,
      notFound: Color.lerp(notFound, other.notFound, t)!,
    );
  }
}

extension ArchiveColorsX on BuildContext {
  ArchiveColors get archiveColors => Theme.of(this).extension<ArchiveColors>()!;
}
