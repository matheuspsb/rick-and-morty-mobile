import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/detail_section.dart';

import '../../../support/pump_app.dart';

void main() {
  testWidgets('renders the title and each label/value row', (tester) async {
    await tester.pumpApp(
      const Scaffold(
        body: DetailSection(
          title: 'ORIGEM',
          rows: [('NOME', 'Earth (C-137)')],
        ),
      ),
    );

    expect(find.text('ORIGEM'), findsOneWidget);
    expect(find.text('NOME'), findsOneWidget);
    expect(find.text('Earth (C-137)'), findsOneWidget);
  });
}
