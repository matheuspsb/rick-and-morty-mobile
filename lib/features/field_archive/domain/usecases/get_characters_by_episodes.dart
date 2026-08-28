import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/repositories/character_repository.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';

class GetCharactersByEpisodes {
  const GetCharactersByEpisodes(this._repository);

  final CharacterRepository _repository;

  Future<List<Character>> call(String rawEpisodeIds) async {
    final query = EpisodeQuery.tryParse(rawEpisodeIds);
    if (query == null) {
      throw const InvalidInputFailure();
    }
    return _repository.charactersByEpisodes(query);
  }
}
