import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';

void main() {
  const light = ArchiveColors.light;

  group('copyWith', () {
    test('returns an equivalent instance when given no overrides', () {
      final copy = light.copyWith();

      expect(copy.line, light.line);
      expect(copy.accent, light.accent);
      expect(copy.statusAlive, light.statusAlive);
      expect(copy.notFound, light.notFound);
    });

    test('replaces only the provided field', () {
      const red = Color(0xFFFF0000);
      final copy = light.copyWith(line: red);

      expect(copy.line, red);
      expect(copy.panel, light.panel);
      expect(copy.muted, light.muted);
    });
  });

  group('lerp', () {
    test('returns itself when other is null', () {
      expect(light.lerp(null, 0.5), same(light));
    });

    test('t = 0 keeps this, t = 1 reaches other', () {
      final other = light.copyWith(line: const Color(0xFF000000));

      expect(light.lerp(other, 0).line, light.line);
      expect(light.lerp(other, 1).line, other.line);
    });

    test('interpolates between the two colours', () {
      final other = light.copyWith(accent: const Color(0xFF000000));
      final mid = light.lerp(other, 0.5);

      expect(mid.accent, Color.lerp(light.accent, other.accent, 0.5));
    });
  });
}
