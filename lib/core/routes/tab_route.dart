import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

enum TabRoute { feed, calendar, profile }

extension TabRouteExtension on TabRoute {
  String get label {
    switch (this) {
      case TabRoute.feed:
        return 'Feed';
      case TabRoute.calendar:
        return 'Calendar';
      case TabRoute.profile:
        return 'Profile';
    }
  }

  String get path {
    switch (this) {
      case TabRoute.feed:
        return '/feed';
      case TabRoute.calendar:
        return '/calendar';
      case TabRoute.profile:
        return '/profile';
    }
  }

  FaIcon get icon {
    switch (this) {
      case TabRoute.feed:
        return const FaIcon(FontAwesomeIcons.images);
      case TabRoute.calendar:
        return const FaIcon(FontAwesomeIcons.calendarDays);
      case TabRoute.profile:
        return const FaIcon(FontAwesomeIcons.circleUser);
    }
  }

  FaIcon get selectedIcon {
    switch (this) {
      case TabRoute.feed:
        return const FaIcon(FontAwesomeIcons.solidImages);
      case TabRoute.calendar:
        return const FaIcon(FontAwesomeIcons.solidCalendarDays);
      case TabRoute.profile:
        return const FaIcon(FontAwesomeIcons.solidCircleUser);
    }
  }
}

class TabRouteWidget extends StatelessWidget {
  const TabRouteWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go(TabRoute.feed.path);
            break;
          case 1:
            context.go(TabRoute.calendar.path);
            break;
          case 2:
            context.go(TabRoute.profile.path);
            break;
        }
      },
      destinations:
          TabRoute.values
              .map(
                (route) => NavigationDestination(
                  label: route.label,
                  icon: route.icon,
                  selectedIcon: route.selectedIcon,
                ),
              )
              .toList(),
    );
  }
}
