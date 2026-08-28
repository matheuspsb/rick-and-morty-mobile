import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_morty_mobile/core/env/app_env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final env = ref.watch(appEnvProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  if (env.isDev && !kReleaseMode) {
    dio.interceptors.add(LogInterceptor());
  }

  ref.onDispose(dio.close);
  return dio;
}
