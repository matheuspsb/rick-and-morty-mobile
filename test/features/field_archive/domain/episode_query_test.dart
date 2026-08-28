import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';

void main() {
  group('EpisodeQuery.tryParse', () {
    test('parses a single id', () {
      expect(EpisodeQuery.tryParse('10')?.ids, [10]);
    });

    test('parses a comma-separated list', () {
      expect(EpisodeQuery.tryParse('10,28')?.ids, [10, 28]);
    });

    test('trims whitespace and drops empty segments', () {
      expect(EpisodeQuery.tryParse('  10 , , 28 ')?.ids, [10, 28]);
    });

    test('deduplicates while preserving first-seen order', () {
      expect(EpisodeQuery.tryParse('28,10,28,10')?.ids, [28, 10]);
    });

    test('returns null for empty or blank input', () {
      expect(EpisodeQuery.tryParse(''), isNull);
      expect(EpisodeQuery.tryParse('   '), isNull);
      expect(EpisodeQuery.tryParse(','), isNull);
    });

    test('returns null for non-numeric input', () {
      expect(EpisodeQuery.tryParse('abc'), isNull);
      expect(EpisodeQuery.tryParse('10,x'), isNull);
      expect(EpisodeQuery.tryParse('10-28'), isNull);
    });

    test('exposes ids as an unmodifiable list', () {
      final query = EpisodeQuery.tryParse('1')!;
      expect(() => query.ids.add(2), throwsUnsupportedError);
    });
  });

  test('toPathSegment rebuilds the canonical query string', () {
    expect(EpisodeQuery.tryParse(' 10 , 28 ')!.toPathSegment(), '10,28');
  });

  group('value equality', () {
    test('equal ids compare equal regardless of raw formatting', () {
      expect(
        EpisodeQuery.tryParse('10,28'),
        EpisodeQuery.tryParse(' 10 ,28 '),
      );
      expect(
        EpisodeQuery.tryParse('10,28').hashCode,
        EpisodeQuery.tryParse('10,28').hashCode,
      );
    });

    test('different order is not equal', () {
      expect(
        EpisodeQuery.tryParse('10,28'),
        isNot(EpisodeQuery.tryParse('28,10')),
      );
    });
  });
}
