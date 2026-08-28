import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';

typedef DetailRow = (String label, String value);

class DetailSection extends StatelessWidget {
  const DetailSection({
    required this.title,
    required this.rows,
    this.showDivider = true,
    super.key,
  });

  final String title;
  final List<DetailRow> rows;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.archiveColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: showDivider
            ? Border(bottom: BorderSide(color: colors.line))
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            for (final (label, value) in rows)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 108,
                      child: Text(
                        label,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colors.muted,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(value, style: theme.textTheme.labelMedium),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
