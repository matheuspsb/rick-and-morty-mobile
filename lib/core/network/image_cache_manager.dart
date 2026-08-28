import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_cache_manager.g.dart';

@Riverpod(keepAlive: true)
BaseCacheManager imageCacheManager(Ref ref) => DefaultCacheManager();
