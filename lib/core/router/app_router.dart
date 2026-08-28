import 'package:go_router/go_router.dart';
import 'package:rick_morty_mobile/core/router/routes.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/pages/character_detail_page.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/pages/field_archive_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: Routes.archive,
    routes: [
      GoRoute(
        path: Routes.archive,
        builder: (context, state) => const FieldArchivePage(),
        routes: [
          GoRoute(
            path: 'character/:id',
            name: Routes.characterDetailName,
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '');
              if (id == null) return const FieldArchivePage();
              return CharacterDetailPage(characterId: id);
            },
          ),
        ],
      ),
    ],
  );
}
