import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/l10n_labels.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({required this.status, this.dotSize = 6, super.key});

  final CharacterStatus status;
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.archiveColors;

    final color = switch (status) {
      CharacterStatus.alive => colors.statusAlive,
      CharacterStatus.dead => colors.statusDead,
      CharacterStatus.unknown => colors.statusUnknown,
    };
    final label = statusLabel(l10n, status);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}
