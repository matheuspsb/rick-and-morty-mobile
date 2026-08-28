import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await _loadAppFonts();
  await testMain();
}

const _fontFamilies = <String, List<String>>{
  'Oswald': [
    'assets/fonts/Oswald-Regular.ttf',
    'assets/fonts/Oswald-Medium.ttf',
    'assets/fonts/Oswald-SemiBold.ttf',
    'assets/fonts/Oswald-Bold.ttf',
  ],
  'IBM Plex Sans': [
    'assets/fonts/IBMPlexSans-Regular.ttf',
    'assets/fonts/IBMPlexSans-Medium.ttf',
    'assets/fonts/IBMPlexSans-SemiBold.ttf',
  ],
  'IBM Plex Mono': [
    'assets/fonts/IBMPlexMono-Regular.ttf',
    'assets/fonts/IBMPlexMono-Medium.ttf',
  ],
};

Future<void> _loadAppFonts() async {
  for (final MapEntry(key: family, value: assets) in _fontFamilies.entries) {
    final loader = FontLoader(family);
    for (final asset in assets) {
      loader.addFont(rootBundle.load(asset));
    }
    await loader.load();
  }
}
