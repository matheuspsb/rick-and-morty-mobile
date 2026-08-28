import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/formatters.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_card.dart';

import '../../../support/fixtures.dart';
import '../../../support/pump_app.dart';

Widget _boxed(Character character, {VoidCallback? onTap}) => Scaffold(
  body: Center(
    child: SizedBox(
      width: 190,
      height: 320,
      child: EntityCard(character: character, onTap: onTap ?? () {}),
    ),
  ),
);

void main() {
  testWidgets('shows name, code, species and origin', (tester) async {
    final character = characterFixture(
      id: 7,
      name: 'Birdperson',
      species: 'Bird-Person',
      status: CharacterStatus.dead,
      originName: 'Bird World',
    );

    await tester.pumpApp(_boxed(character));

    expect(find.text('BIRDPERSON'), findsOneWidget);
    expect(find.text(formatEntityCode(7)), findsOneWidget);
    expect(find.text('BIRD-PERSON'), findsOneWidget);
    expect(find.text('BIRD WORLD'), findsOneWidget);
  });

  testWidgets('invokes onTap when pressed', (tester) async {
    var tapped = false;
    await tester.pumpApp(
      _boxed(characterFixture(), onTap: () => tapped = true),
    );

    await tester.tap(find.byType(EntityCard));
    expect(tapped, isTrue);
  });
}
