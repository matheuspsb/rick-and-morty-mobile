import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_portrait.dart';

class EntityCardSkeleton extends StatelessWidget {
  const EntityCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.archiveColors;
    final bar = colors.line.withValues(alpha: 0.5);

    return ExcludeSemantics(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.panel,
          borderRadius: ArchiveTokens.borderRadius,
          border: Border.all(color: colors.line),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: PortraitAspect.card.ratio,
              child: ColoredBox(color: colors.texture),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Bar(color: bar, width: 120),
                    const SizedBox(height: 10),
                    _Bar(color: bar, width: 72),
                    const SizedBox(height: 10),
                    _Bar(color: bar, width: 96),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.color, required this.width});

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}
