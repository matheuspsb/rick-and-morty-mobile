import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/core/router/app_router.dart';
import 'package:rick_morty_mobile/core/theme/archive_theme.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class RickMortyApp extends ConsumerWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: ArchiveTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pt'),
      routerConfig: router,
    );
  }
}
