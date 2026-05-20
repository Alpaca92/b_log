import 'package:b_log/core/routes/tab_route.dart';
import 'package:b_log/features/calendar/presentation/calendar_page.dart';
import 'package:b_log/features/feed/presentation/feed_page.dart';
import 'package:b_log/features/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Page<void> _fadePage({required LocalKey key, required Widget child}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

const _pages = <TabRoute, Widget>{
  TabRoute.feed: FeedPage(),
  TabRoute.calendar: CalendarPage(),
  TabRoute.profile: ProfilePage(),
};

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: TabRoute.calendar.path,
    routes:
        TabRoute.values
            .map(
              (route) => GoRoute(
                path: route.path,
                pageBuilder:
                    (context, state) =>
                        _fadePage(key: state.pageKey, child: _pages[route]!),
              ),
            )
            .toList(),
  );
});
