import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/formatters.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class EntitySummaryBar extends StatelessWidget {
  const EntitySummaryBar({
    required this.count,
    required this.rawEpisodeIds,
    super.key,
  });

  final int count;
  final String rawEpisodeIds;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.archiveColors;
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.line),
          bottom: BorderSide(color: colors.line),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.summaryObservedCount(count),
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            l10n.summaryEpisodes(formatEpisodeIdsForDisplay(rawEpisodeIds)),
            style: theme.textTheme.labelMedium?.copyWith(color: colors.muted),
          ),
        ],
      ),
    );
  }
}
