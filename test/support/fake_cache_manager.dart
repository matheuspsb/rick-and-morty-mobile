import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mocktail/mocktail.dart';

class _FakeCacheManager extends Mock implements BaseCacheManager {}

/// A cache manager whose file stream always errors, so widgets that render
/// network images fall straight through to their error/fallback state without
/// touching `path_provider` / `sqflite` (unavailable in `flutter test`).
BaseCacheManager fakeImageCacheManager() {
  final manager = _FakeCacheManager();
  when(
    () => manager.getFileStream(
      any(),
      key: any(named: 'key'),
      headers: any(named: 'headers'),
      withProgress: any(named: 'withProgress'),
    ),
  ).thenAnswer(
    (_) => Stream<FileResponse>.error(Exception('no network in tests')),
  );
  return manager;
}
