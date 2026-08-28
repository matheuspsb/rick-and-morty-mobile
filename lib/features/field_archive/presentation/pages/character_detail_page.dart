import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/controllers/character_detail_controller.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/character_detail_view.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class CharacterDetailPage extends ConsumerWidget {
  const CharacterDetailPage({
    required this.characterId,
    this.character,
    super.key,
  });

  final int characterId;
  final Character? character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final preloaded = character;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.detailHeading)),
      body: SafeArea(
        child: preloaded != null
            ? CharacterDetailView(character: preloaded)
            : ref
                  .watch(characterByIdProvider(characterId))
                  .when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, _) => _DetailError(
                      error: error,
                      onRetry: () => ref.invalidate(
                        characterByIdProvider(characterId),
                      ),
                    ),
                    data: (character) =>
                        CharacterDetailView(character: character),
                  ),
      ),
    );
  }
}

class _DetailError extends StatelessWidget {
  const _DetailError({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.archiveColors;

    final (title, description) = switch (error) {
      NotFoundFailure() => (
        l10n.characterNotFoundTitle,
        l10n.characterNotFoundDescription,
      ),
      _ => (l10n.connectionErrorTitle, l10n.connectionErrorDescription),
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
            ),
            const SizedBox(height: 20),
            TextButton(onPressed: onRetry, child: Text(l10n.retry)),
          ],
        ),
      ),
    );
  }
}
