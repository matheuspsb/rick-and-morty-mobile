import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/env/app_env.dart';

void main() {
  group('AppEnv.parse', () {
    test('reads an absolute http url and a known flavor', () {
      final env = AppEnv.parse(
        rawBaseUrl: 'http://10.0.2.2:3000',
        rawFlavor: 'dev',
      );

      expect(env.apiBaseUrl, 'http://10.0.2.2:3000');
      expect(env.flavor, AppFlavor.dev);
      expect(env.isDev, isTrue);
    });

    test('accepts https and the prod flavor', () {
      final env = AppEnv.parse(
        rawBaseUrl: 'https://api.example.com',
        rawFlavor: 'prod',
      );

      expect(env.flavor, AppFlavor.prod);
      expect(env.isDev, isFalse);
    });

    test('falls back to dev for an unknown flavor', () {
      final env = AppEnv.parse(
        rawBaseUrl: 'http://localhost:3000',
        rawFlavor: 'staging',
      );

      expect(env.flavor, AppFlavor.dev);
    });

    test('throws on a non-absolute or non-http url', () {
      expect(
        () => AppEnv.parse(rawBaseUrl: 'localhost:3000', rawFlavor: 'dev'),
        throwsArgumentError,
      );
      expect(
        () => AppEnv.parse(rawBaseUrl: 'ftp://example.com', rawFlavor: 'dev'),
        throwsArgumentError,
      );
      expect(
        () => AppEnv.parse(rawBaseUrl: '', rawFlavor: 'dev'),
        throwsArgumentError,
      );
    });

    test('value equality', () {
      final a = AppEnv.parse(rawBaseUrl: 'http://a.com', rawFlavor: 'dev');
      final b = AppEnv.parse(rawBaseUrl: 'http://a.com', rawFlavor: 'dev');

      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });
  });
}
