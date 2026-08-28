import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_env.g.dart';

enum AppFlavor { dev, prod }

@immutable
class AppEnv {
  const AppEnv._({required this.apiBaseUrl, required this.flavor});

  factory AppEnv.fromEnvironment() => AppEnv.parse(
    rawBaseUrl: const String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: _defaultBaseUrl,
    ),
    rawFlavor: const String.fromEnvironment('APP_ENV', defaultValue: 'prod'),
  );

  @visibleForTesting
  factory AppEnv.parse({
    required String rawBaseUrl,
    required String rawFlavor,
  }) {
    final uri = Uri.tryParse(rawBaseUrl);
    final validUrl =
        uri != null &&
        uri.isAbsolute &&
        (uri.isScheme('http') || uri.isScheme('https')) &&
        uri.host.isNotEmpty;
    if (!validUrl) {
      throw ArgumentError.value(
        rawBaseUrl,
        'API_BASE_URL',
        'must be an absolute http(s) URL',
      );
    }

    final flavor = AppFlavor.values.firstWhere(
      (flavor) => flavor.name == rawFlavor,
      orElse: () => AppFlavor.dev,
    );

    return AppEnv._(apiBaseUrl: rawBaseUrl, flavor: flavor);
  }

  static const _defaultBaseUrl = 'https://rick-and-morty-backend-nu.vercel.app';

  final String apiBaseUrl;
  final AppFlavor flavor;

  bool get isDev => flavor == AppFlavor.dev;

  @override
  bool operator ==(Object other) =>
      other is AppEnv &&
      other.apiBaseUrl == apiBaseUrl &&
      other.flavor == flavor;

  @override
  int get hashCode => Object.hash(apiBaseUrl, flavor);
}

@Riverpod(keepAlive: true)
AppEnv appEnv(Ref ref) => AppEnv.fromEnvironment();
