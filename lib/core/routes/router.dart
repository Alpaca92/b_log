import 'package:b_log/core/routes/tab_route.dart';
import 'package:b_log/features/calendar/presentation/calendar_page.dart';
import 'package:b_log/features/feed/presentation/feed_page.dart';
import 'package:b_log/features/profile/presentation/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: TabRoute.calendar.path,
    routes: [
      GoRoute(
        path: TabRoute.calendar.path,
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: TabRoute.feed.path,
        builder: (context, state) => const FeedPage(),
      ),
      GoRoute(
        path: TabRoute.profile.path,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
});
