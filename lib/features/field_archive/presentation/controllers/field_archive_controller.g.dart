// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_archive_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCharactersByEpisodes)
final getCharactersByEpisodesProvider = GetCharactersByEpisodesProvider._();

final class GetCharactersByEpisodesProvider
    extends
        $FunctionalProvider<
          GetCharactersByEpisodes,
          GetCharactersByEpisodes,
          GetCharactersByEpisodes
        >
    with $Provider<GetCharactersByEpisodes> {
  GetCharactersByEpisodesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCharactersByEpisodesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCharactersByEpisodesHash();

  @$internal
  @override
  $ProviderElement<GetCharactersByEpisodes> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCharactersByEpisodes create(Ref ref) {
    return getCharactersByEpisodes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCharactersByEpisodes value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCharactersByEpisodes>(value),
    );
  }
}

String _$getCharactersByEpisodesHash() =>
    r'15d31ae62d963268163e1baa71e4bd242d949455';

@ProviderFor(SubmittedEpisodeIds)
final submittedEpisodeIdsProvider = SubmittedEpisodeIdsProvider._();

final class SubmittedEpisodeIdsProvider
    extends $NotifierProvider<SubmittedEpisodeIds, String?> {
  SubmittedEpisodeIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submittedEpisodeIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submittedEpisodeIdsHash();

  @$internal
  @override
  SubmittedEpisodeIds create() => SubmittedEpisodeIds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$submittedEpisodeIdsHash() =>
    r'bbd88603eb914b2eb333de47e78a6d572a172ac2';

abstract class _$SubmittedEpisodeIds extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(FieldArchiveController)
final fieldArchiveControllerProvider = FieldArchiveControllerProvider._();

final class FieldArchiveControllerProvider
    extends $AsyncNotifierProvider<FieldArchiveController, List<Character>> {
  FieldArchiveControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldArchiveControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldArchiveControllerHash();

  @$internal
  @override
  FieldArchiveController create() => FieldArchiveController();
}

String _$fieldArchiveControllerHash() =>
    r'8a7b4c98cff188331d30aad4b9772bb948dd3a53';

abstract class _$FieldArchiveController
    extends $AsyncNotifier<List<Character>> {
  FutureOr<List<Character>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Character>>, List<Character>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Character>>, List<Character>>,
              AsyncValue<List<Character>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
