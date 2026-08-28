@Tags(['golden'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/character_detail_view.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/entity_card.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/status_indicator.dart';

import '../../../../support/fixtures.dart';
import '../../../../support/pump_app.dart';

void main() {
  testWidgets('EntityCard', (tester) async {
    await tester.pumpApp(
      Scaffold(
        body: Center(
          child: SizedBox(
            width: 190,
            height: 320,
            child: EntityCard(character: characterFixture(), onTap: () {}),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(EntityCard),
      matchesGoldenFile('goldens/entity_card.png'),
    );
  });

  testWidgets('StatusIndicator variants', (tester) async {
    await tester.pumpApp(
      const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusIndicator(status: CharacterStatus.alive),
              SizedBox(height: 8),
              StatusIndicator(status: CharacterStatus.dead),
              SizedBox(height: 8),
              StatusIndicator(status: CharacterStatus.unknown),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(Column).first,
      matchesGoldenFile('goldens/status_indicator.png'),
    );
  });

  testWidgets('CharacterDetailView', (tester) async {
    await tester.pumpApp(
      Scaffold(
        body: SizedBox(
          width: 380,
          height: 720,
          child: CharacterDetailView(character: characterFixture()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(CharacterDetailView),
      matchesGoldenFile('goldens/character_detail_view.png'),
    );
  });
}
