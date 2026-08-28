import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty_mobile/core/network/api_exception.dart';
import 'package:rick_morty_mobile/features/field_archive/data/datasources/character_remote_data_source.dart';

import '../../../support/fixtures.dart';

class _MockDio extends Mock implements Dio {}

Response<T> _response<T>(T data, {int statusCode = 200}) => Response<T>(
  data: data,
  statusCode: statusCode,
  requestOptions: RequestOptions(path: '/'),
);

void main() {
  late _MockDio dio;
  late CharacterRemoteDataSource dataSource;

  setUp(() {
    dio = _MockDio();
    dataSource = CharacterRemoteDataSourceImpl(dio);
  });

  group('charactersByEpisodes', () {
    test('requests the episodes endpoint and parses the list', () async {
      when(() => dio.get<List<dynamic>>('/episodes/10,28/characters'))
          .thenAnswer(
            (_) async => _response<List<dynamic>>([
              characterJsonFixture(),
              characterJsonFixture(id: 2),
            ]),
          );

      final result = await dataSource.charactersByEpisodes('10,28');

      expect(result.map((dto) => dto.id), [1, 2]);
    });

    test('maps a DioException to an ApiException', () async {
      when(() => dio.get<List<dynamic>>(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/'),
          response: Response<dynamic>(
            requestOptions: RequestOptions(path: '/'),
            statusCode: 400,
            data: {'error': 'ids must be a number'},
          ),
        ),
      );

      await expectLater(
        dataSource.charactersByEpisodes('x'),
        throwsA(
          isA<ApiException>()
              .having((e) => e.statusCode, 'statusCode', 400)
              .having((e) => e.message, 'message', 'ids must be a number'),
        ),
      );
    });
  });

  group('characterById', () {
    test('requests the character endpoint and parses the object', () async {
      when(() => dio.get<Map<String, dynamic>>('/character/1')).thenAnswer(
        (_) async => _response<Map<String, dynamic>>(characterJsonFixture()),
      );

      final result = await dataSource.characterById(1);

      expect(result.name, 'Rick Sanchez');
    });

    test('maps a connection DioException to an ApiException', () async {
      when(() => dio.get<Map<String, dynamic>>(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/'),
          type: DioExceptionType.connectionError,
          message: 'offline',
        ),
      );

      await expectLater(
        dataSource.characterById(1),
        throwsA(
          isA<ApiException>().having(
            (e) => e.isConnectionError,
            'isConnectionError',
            isTrue,
          ),
        ),
      );
    });
  });
}
