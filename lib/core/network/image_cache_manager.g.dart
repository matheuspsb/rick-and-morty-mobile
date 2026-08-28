// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_cache_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageCacheManager)
final imageCacheManagerProvider = ImageCacheManagerProvider._();

final class ImageCacheManagerProvider
    extends
        $FunctionalProvider<
          BaseCacheManager,
          BaseCacheManager,
          BaseCacheManager
        >
    with $Provider<BaseCacheManager> {
  ImageCacheManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageCacheManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageCacheManagerHash();

  @$internal
  @override
  $ProviderElement<BaseCacheManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BaseCacheManager create(Ref ref) {
    return imageCacheManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseCacheManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseCacheManager>(value),
    );
  }
}

String _$imageCacheManagerHash() => r'b53532c689e19d4876c58067ac2ead099385ce40';
