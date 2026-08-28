// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_remote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(characterRemoteDataSource)
final characterRemoteDataSourceProvider = CharacterRemoteDataSourceProvider._();

final class CharacterRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CharacterRemoteDataSource,
          CharacterRemoteDataSource,
          CharacterRemoteDataSource
        >
    with $Provider<CharacterRemoteDataSource> {
  CharacterRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CharacterRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CharacterRemoteDataSource create(Ref ref) {
    return characterRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CharacterRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CharacterRemoteDataSource>(value),
    );
  }
}

String _$characterRemoteDataSourceHash() =>
    r'4baeafa06f90a8f5a1fdba6ec884f996b1ab4251';
