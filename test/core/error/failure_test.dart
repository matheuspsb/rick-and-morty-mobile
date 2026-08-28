import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/core/error/failure.dart';
import 'package:rick_morty_mobile/core/network/api_exception.dart';

void main() {
  group('Failure.fromApiException', () {
    test('maps 400 to InvalidInputFailure', () {
      final failure = Failure.fromApiException(
        const ApiException(message: 'bad', statusCode: 400),
      );
      expect(failure, isA<InvalidInputFailure>());
    });

    test('maps 404 to NotFoundFailure', () {
      final failure = Failure.fromApiException(
        const ApiException(message: 'missing', statusCode: 404),
      );
      expect(failure, isA<NotFoundFailure>());
    });

    test('maps a null status code to ConnectionFailure', () {
      final failure = Failure.fromApiException(
        const ApiException(message: 'offline'),
      );
      expect(failure, isA<ConnectionFailure>());
    });

    test('maps any other status code to UnknownFailure', () {
      final failure = Failure.fromApiException(
        const ApiException(message: 'boom', statusCode: 500),
      );
      expect(failure, isA<UnknownFailure>());
    });
  });
}
