import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/network/image_cache_manager.dart';
import 'package:rick_morty_mobile/core/theme/archive_theme.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

import 'fake_cache_manager.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    List<Override> overrides = const [],
  }) {
    return pumpWidget(
      ProviderScope(
        overrides: [
          imageCacheManagerProvider.overrideWithValue(fakeImageCacheManager()),
          ...overrides,
        ],
        child: MaterialApp(
          theme: ArchiveTheme.light,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('pt'),
          home: widget,
        ),
      ),
    );
  }
}
