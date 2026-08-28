import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_card.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_card_skeleton.dart';

const _gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 190,
  mainAxisExtent: 320,
  crossAxisSpacing: 16,
  mainAxisSpacing: 16,
);

class EntityGrid extends StatelessWidget {
  const EntityGrid({
    required this.characters,
    required this.onCharacterTap,
    super.key,
  });

  final List<Character> characters;
  final ValueChanged<Character> onCharacterTap;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: _gridDelegate,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return EntityCard(
          character: character,
          onTap: () => onCharacterTap(character),
        );
      },
    );
  }
}

class EntityGridSkeleton extends StatelessWidget {
  const EntityGridSkeleton({this.itemCount = 6, super.key});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: _gridDelegate,
      itemCount: itemCount,
      itemBuilder: (context, index) => const EntityCardSkeleton(),
    );
  }
}
