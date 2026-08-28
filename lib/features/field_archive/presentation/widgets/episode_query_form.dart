import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/core/theme/archive_colors.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/controllers/field_archive_controller.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

class EpisodeQueryForm extends ConsumerStatefulWidget {
  const EpisodeQueryForm({super.key});

  @override
  ConsumerState<EpisodeQueryForm> createState() => _EpisodeQueryFormState();
}

class _EpisodeQueryFormState extends ConsumerState<EpisodeQueryForm> {
  late final TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final raw = _controller.text;
    final l10n = AppLocalizations.of(context);

    if (EpisodeQuery.tryParse(raw) == null) {
      setState(() => _errorText = l10n.invalidEpisodeIdsDescription);
      return;
    }

    setState(() => _errorText = null);
    FocusScope.of(context).unfocus();
    ref.read(submittedEpisodeIdsProvider.notifier).submit(raw);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.archiveColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(l10n.queryHeading, style: theme.textTheme.titleMedium),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.queryDescription,
          style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                ],
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _submit(),
                decoration: InputDecoration(
                  hintText: l10n.queryPlaceholder,
                  errorText: _errorText,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton(onPressed: _submit, child: Text(l10n.querySubmit)),
          ],
        ),
      ],
    );
  }
}
