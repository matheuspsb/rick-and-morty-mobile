import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class ArchiveHeader extends StatelessWidget implements PreferredSizeWidget {
  const ArchiveHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.archiveColors;
    final l10n = AppLocalizations.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.line)),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.headerBrand,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colors.muted,
                ),
              ),
              Text(l10n.headerTitle, style: theme.textTheme.headlineMedium),
            ],
          ),
        ),
      ),
    );
  }
}
