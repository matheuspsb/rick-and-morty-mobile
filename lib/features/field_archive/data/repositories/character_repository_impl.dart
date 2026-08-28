import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/core/network/api_exception.dart';
import 'package:rick_morty_mobile/features/field_archive/data/datasources/character_remote_data_source.dart';
import 'package:rick_morty_mobile/features/field_archive/data/dtos/character_mapper.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/repositories/character_repository.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/value_objects/episode_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_repository_impl.g.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  const CharacterRepositoryImpl(this._remote);

  final CharacterRemoteDataSource _remote;

  @override
  Future<List<Character>> charactersByEpisodes(EpisodeQuery query) async {
    try {
      final dtos = await _remote.charactersByEpisodes(query.toPathSegment());
      return dtos.map((dto) => dto.toDomain()).toList();
    } on ApiException catch (error) {
      throw Failure.fromApiException(error);
    }
  }

  @override
  Future<Character> characterById(int id) async {
    try {
      final dto = await _remote.characterById(id);
      return dto.toDomain();
    } on ApiException catch (error) {
      throw Failure.fromApiException(error);
    }
  }
}

@Riverpod(keepAlive: true)
CharacterRepository characterRepository(Ref ref) =>
    CharacterRepositoryImpl(ref.watch(characterRemoteDataSourceProvider));
