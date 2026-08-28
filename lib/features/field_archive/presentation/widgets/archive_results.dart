import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/controllers/field_archive_controller.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/archive_states.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_grid.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_summary_bar.dart';

class ArchiveResults extends ConsumerWidget {
  const ArchiveResults({required this.onCharacterTap, super.key});

  final ValueChanged<Character> onCharacterTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submitted = ref.watch(submittedEpisodeIdsProvider);
    if (submitted == null) {
      return const EmptyArchiveState();
    }

    final state = ref.watch(fieldArchiveControllerProvider);

    return state.when(
      skipLoadingOnReload: true,
      skipLoadingOnRefresh: false,
      loading: () => const _ResultsLoading(),
      error: (error, _) => ArchiveErrorState(
        error: error,
        onRetry: () => ref.invalidate(fieldArchiveControllerProvider),
      ),
      data: (characters) => RefreshIndicator(
        onRefresh: () => ref.refresh(fieldArchiveControllerProvider.future),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              sliver: SliverToBoxAdapter(
                child: EntitySummaryBar(
                  count: characters.length,
                  rawEpisodeIds: submitted,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              sliver: EntityGrid(
                characters: characters,
                onCharacterTap: onCharacterTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultsLoading extends StatelessWidget {
  const _ResultsLoading();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
          sliver: EntityGridSkeleton(),
        ),
      ],
    );
  }
}
