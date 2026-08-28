// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(characterById)
final characterByIdProvider = CharacterByIdFamily._();

final class CharacterByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Character>,
          Character,
          FutureOr<Character>
        >
    with $FutureModifier<Character>, $FutureProvider<Character> {
  CharacterByIdProvider._({
    required CharacterByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'characterByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$characterByIdHash();

  @override
  String toString() {
    return r'characterByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Character> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Character> create(Ref ref) {
    final argument = this.argument as int;
    return characterById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$characterByIdHash() => r'acf60f36d330639bd5ed1d991441588cbeb1fe71';

final class CharacterByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Character>, int> {
  CharacterByIdFamily._()
    : super(
        retry: null,
        name: r'characterByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CharacterByIdProvider call(int id) =>
      CharacterByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'characterByIdProvider';
}
