import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/family/presentation/family_page.dart';
import '../features/feed/presentation/feed_page.dart';
import '../features/media/presentation/media_detail_page.dart';
import '../features/settings/presentation/settings_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/feed',
    routes: [
      GoRoute(path: '/feed', builder: (context, state) => const FeedPage()),
      GoRoute(path: '/family', builder: (context, state) => const FamilyPage()),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: '/media/:id',
        builder: (context, state) {
          final mediaId = state.pathParameters['id'] ?? '';
          return MediaDetailPage(mediaId: mediaId);
        },
      ),
    ],
  );
});
