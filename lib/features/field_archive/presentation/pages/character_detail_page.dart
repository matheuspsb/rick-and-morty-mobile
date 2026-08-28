import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class CharacterDetailPage extends ConsumerWidget {
  const CharacterDetailPage({required this.characterId, super.key});

  final int characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.detailHeading)),
      body: Center(
        child: Text(l10n.detailIdLabel(characterId.toString())),
      ),
    );
  }
}
