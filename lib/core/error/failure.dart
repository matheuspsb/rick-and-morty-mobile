import 'package:rick_morty_mobile/core/network/api_exception.dart';

sealed class Failure implements Exception {
  const Failure();

  factory Failure.fromApiException(ApiException exception) =>
      switch (exception.statusCode) {
        400 => const InvalidInputFailure(),
        404 => const NotFoundFailure(),
        null => const ConnectionFailure(),
        _ => const UnknownFailure(),
      };
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure();
}

class NotFoundFailure extends Failure {
  const NotFoundFailure();
}

class ConnectionFailure extends Failure {
  const ConnectionFailure();
}

class UnknownFailure extends Failure {
  const UnknownFailure();
}
