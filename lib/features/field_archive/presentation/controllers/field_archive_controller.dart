import 'package:rick_morty_mobile/features/field_archive/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/usecases/get_characters_by_episodes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'field_archive_controller.g.dart';

@Riverpod(keepAlive: true)
GetCharactersByEpisodes getCharactersByEpisodes(Ref ref) =>
    GetCharactersByEpisodes(ref.watch(characterRepositoryProvider));

@riverpod
class SubmittedEpisodeIds extends _$SubmittedEpisodeIds {
  @override
  String? build() => null;

  void submit(String rawEpisodeIds) => state = rawEpisodeIds;
}

@riverpod
class FieldArchiveController extends _$FieldArchiveController {
  @override
  Future<List<Character>> build() async {
    final rawEpisodeIds = ref.watch(submittedEpisodeIdsProvider);
    if (rawEpisodeIds == null) return const [];

    return ref.watch(getCharactersByEpisodesProvider)(rawEpisodeIds);
  }
}
