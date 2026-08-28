import 'package:rick_morty_mobile/features/field_archive/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_detail_controller.g.dart';

@riverpod
Future<Character> characterById(Ref ref, int id) =>
    ref.watch(characterRepositoryProvider).characterById(id);
