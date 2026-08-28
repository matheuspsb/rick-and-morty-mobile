import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty_mobile/core/router/routes.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/archive_header.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/archive_results.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/episode_query_form.dart';

class FieldArchivePage extends ConsumerWidget {
  const FieldArchivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const ArchiveHeader(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: EpisodeQueryForm(),
          ),
          Expanded(
            child: ArchiveResults(
              onCharacterTap: (character) => _openDetail(context, character),
            ),
          ),
        ],
      ),
    );
  }

  void _openDetail(BuildContext context, Character character) {
    unawaited(
      context.pushNamed(
        Routes.characterDetailName,
        pathParameters: {'id': character.id.toString()},
        extra: character,
      ),
    );
  }
}
