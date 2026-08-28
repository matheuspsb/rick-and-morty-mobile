import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';

/// Implementations throw a `Failure` on any error path; the happy path returns
/// the requested data.
abstract interface class CharacterRepository {
  Future<List<Character>> charactersByEpisodes(EpisodeQuery query);

  Future<Character> characterById(int id);
}
