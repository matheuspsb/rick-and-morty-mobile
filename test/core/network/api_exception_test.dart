import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/network/api_exception.dart';

RequestOptions _options() => RequestOptions(path: '/character/1');

void main() {
  group('ApiException.fromDioException', () {
    test('extracts status code and the server "error" message', () {
      final exception = ApiException.fromDioException(
        DioException(
          requestOptions: _options(),
          response: Response<dynamic>(
            requestOptions: _options(),
            statusCode: 404,
            data: {'error': 'Character not found'},
          ),
        ),
      );

      expect(exception.statusCode, 404);
      expect(exception.message, 'Character not found');
      expect(exception.isConnectionError, isFalse);
    });

    test('with no response is treated as a connection error', () {
      final exception = ApiException.fromDioException(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.connectionError,
          message: 'Connection refused',
        ),
      );

      expect(exception.statusCode, isNull);
      expect(exception.isConnectionError, isTrue);
      expect(exception.message, 'Connection refused');
    });

    test('falls back to a generic message when nothing is available', () {
      final exception = ApiException.fromDioException(
        DioException(requestOptions: _options()),
      );

      expect(exception.message, isNotEmpty);
    });
  });
}
