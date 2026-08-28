import 'package:dio/dio.dart';

class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode});

  factory ApiException.fromDioException(DioException exception) {
    final response = exception.response;
    final statusCode = response?.statusCode;

    final data = response?.data;
    final serverMessage =
        data is Map<String, dynamic> && data['error'] is String
        ? data['error'] as String
        : null;

    return ApiException(
      statusCode: statusCode,
      message: serverMessage ?? exception.message ?? 'Unexpected network error',
    );
  }

  final String message;
  final int? statusCode;

  bool get isConnectionError => statusCode == null;

  @override
  String toString() => 'ApiException($statusCode, $message)';
}
