import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/app/app.dart';

Future<void> bootstrap() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = FlutterError.presentError;

      runApp(
        const ProviderScope(
          child: RickMortyApp(),
        ),
      );
    },
    (error, stack) => debugPrint('Uncaught zone error: $error\n$stack'),
  );
}
