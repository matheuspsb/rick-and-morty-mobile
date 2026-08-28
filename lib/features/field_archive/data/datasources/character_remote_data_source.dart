import 'package:dio/dio.dart';
import 'package:rick_morty_mobile/core/network/api_exception.dart';
import 'package:rick_morty_mobile/core/network/dio_provider.dart';
import 'package:rick_morty_mobile/features/field_archive/data/dtos/character_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_remote_data_source.g.dart';

abstract interface class CharacterRemoteDataSource {
  Future<List<CharacterDto>> charactersByEpisodes(String idsPathSegment);

  Future<CharacterDto> characterById(int id);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  const CharacterRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<CharacterDto>> charactersByEpisodes(String idsPathSegment) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/episodes/$idsPathSegment/characters',
      );
      final data = response.data ?? const [];
      return data
          .cast<Map<String, dynamic>>()
          .map(CharacterDto.fromJson)
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  @override
  Future<CharacterDto> characterById(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/character/$id');
      return CharacterDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }
}

@Riverpod(keepAlive: true)
CharacterRemoteDataSource characterRemoteDataSource(Ref ref) =>
    CharacterRemoteDataSourceImpl(ref.watch(dioProvider));
