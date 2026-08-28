import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/formatters.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/l10n_labels.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/detail_section.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_portrait.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/status_indicator.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.archiveColors;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.detailHeading,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Text(
                l10n.detailIdLabel(padEntityId(character.id)),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colors.muted,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 140,
                child: EntityPortrait(
                  imageUrl: character.image,
                  aspect: PortraitAspect.detail,
                  fallbackLabel: l10n.portraitFallback,
                  semanticLabel: character.name,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(child: _NameBlock(character: character)),
            ],
          ),
          const SizedBox(height: 20),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: ArchiveTokens.borderRadius,
              border: Border.all(color: colors.line),
            ),
            child: Column(
              children: [
                DetailSection(
                  title: l10n.detailSectionOrigin,
                  rows: [(l10n.detailRowName, character.origin.name)],
                ),
                DetailSection(
                  title: l10n.detailSectionLocation,
                  rows: [(l10n.detailRowName, character.location.name)],
                ),
                DetailSection(
                  title: l10n.detailSectionEpisodes,
                  rows: [
                    (l10n.detailRowTotal, character.episodeCount.toString()),
                  ],
                  showDivider: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NameBlock extends StatelessWidget {
  const _NameBlock({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.archiveColors;
    final mutedLabel = theme.textTheme.labelMedium?.copyWith(
      color: colors.muted,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          character.name.toUpperCase(),
          style: theme.textTheme.displaySmall,
        ),
        const SizedBox(height: 2),
        Text(
          formatEntityCode(character.id),
          style: theme.textTheme.titleLarge?.copyWith(color: colors.accent),
        ),
        const Divider(height: 20),
        Text(l10n.detailStatus, style: mutedLabel),
        const SizedBox(height: 4),
        StatusIndicator(status: character.status, dotSize: 8),
        const Divider(height: 20),
        _Attribute(label: l10n.detailSpecies, value: character.species),
        _Attribute(
          label: l10n.detailType,
          value: character.type.isEmpty
              ? l10n.detailValueUnknown
              : character.type,
        ),
        _Attribute(
          label: l10n.detailGender,
          value: genderLabel(l10n, character.gender),
        ),
      ],
    );
  }
}

class _Attribute extends StatelessWidget {
  const _Attribute({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.archiveColors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 72,
            child: Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(color: colors.muted),
            ),
          ),
          Expanded(
            child: Text(
              value.toUpperCase(),
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
