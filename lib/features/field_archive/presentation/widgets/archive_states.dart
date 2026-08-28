import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class _ArchiveMessage extends StatelessWidget {
  const _ArchiveMessage({
    required this.title,
    required this.description,
    this.titleColor,
    this.action,
  });

  final String title;
  final String description;
  final Color? titleColor;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.archiveColors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: titleColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
            ),
            if (action case final action?) ...[
              const SizedBox(height: 20),
              action,
            ],
          ],
        ),
      ),
    );
  }
}

class EmptyArchiveState extends StatelessWidget {
  const EmptyArchiveState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _ArchiveMessage(
      title: l10n.emptyArchiveTitle,
      description: l10n.emptyArchiveDescription,
    );
  }
}

class ArchiveErrorState extends StatelessWidget {
  const ArchiveErrorState({
    required this.error,
    required this.onRetry,
    super.key,
  });

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.archiveColors;

    final (title, description, tone) = switch (error) {
      InvalidInputFailure() => (
        l10n.invalidEpisodeIdsTitle,
        l10n.invalidEpisodeIdsDescription,
        colors.invalidInput,
      ),
      NotFoundFailure() => (
        l10n.episodeNotFoundTitle,
        l10n.episodeNotFoundDescription,
        colors.notFound,
      ),
      _ => (
        l10n.connectionErrorTitle,
        l10n.connectionErrorDescription,
        colors.muted,
      ),
    };

    return _ArchiveMessage(
      title: title,
      description: description,
      titleColor: tone,
      action: TextButton(onPressed: onRetry, child: Text(l10n.retry)),
    );
  }
}
