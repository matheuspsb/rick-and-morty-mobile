import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/formatters.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_portrait.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/status_indicator.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class EntityCard extends StatelessWidget {
  const EntityCard({required this.character, required this.onTap, super.key});

  final Character character;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.archiveColors;
    final l10n = AppLocalizations.of(context);

    return Semantics(
      button: true,
      label: '${character.name}, ${formatEntityCode(character.id)}',
      child: Material(
        color: colors.panel,
        borderRadius: ArchiveTokens.borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: ArchiveTokens.borderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: ArchiveTokens.borderRadius,
              border: Border.all(color: colors.line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EntityPortrait(
                  imageUrl: character.image,
                  aspect: PortraitAspect.card,
                  fallbackLabel: l10n.portraitFallback,
                  semanticLabel: character.name,
                ),
                Expanded(child: _CardBody(character: character)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.archiveColors;
    final mutedLabel = theme.textTheme.labelMedium?.copyWith(
      color: colors.muted,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            character.name.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(formatEntityCode(character.id), style: mutedLabel),
              const Spacer(),
              StatusIndicator(status: character.status),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            character.species.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium,
          ),
          Text(
            character.origin.name.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: mutedLabel,
          ),
        ],
      ),
    );
  }
}
