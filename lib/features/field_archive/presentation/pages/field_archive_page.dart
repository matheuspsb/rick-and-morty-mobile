import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class FieldArchivePage extends ConsumerWidget {
  const FieldArchivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.headerTitle)),
      body: const SizedBox.shrink(),
    );
  }
}
