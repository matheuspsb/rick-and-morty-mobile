import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pt'),
      home: const _BootstrapPlaceholderPage(),
    );
  }
}

class _BootstrapPlaceholderPage extends StatelessWidget {
  const _BootstrapPlaceholderPage();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.headerBrand),
            Text(
              l10n.headerTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(l10n.headerSubtitle),
          ],
        ),
      ),
    );
  }
}
