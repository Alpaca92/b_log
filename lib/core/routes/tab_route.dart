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

  IconData get icon {
    switch (this) {
      case TabRoute.feed:
        return FontAwesomeIcons.images;
      case TabRoute.calendar:
        return FontAwesomeIcons.calendarDays;
      case TabRoute.profile:
        return FontAwesomeIcons.circleUser;
    }
  }

  IconData get selectedIcon {
    switch (this) {
      case TabRoute.feed:
        return FontAwesomeIcons.solidImages;
      case TabRoute.calendar:
        return FontAwesomeIcons.solidCalendarDays;
      case TabRoute.profile:
        return FontAwesomeIcons.solidCircleUser;
    }
  }
}

class TabRouteWidget extends StatelessWidget {
  const TabRouteWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  void _onDestinationSelected(BuildContext context, int index) {
    if (index < 0 || index >= TabRoute.values.length) return;

    context.go(TabRoute.values[index].path);
  }

  WidgetStateProperty<TextStyle?> _labelTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return WidgetStateProperty.resolveWith((states) {
      final isSelected = states.contains(WidgetState.selected);

      return TextStyle(
        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      );
    });
  }

  List<Widget> _destinations(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.primary;

    return TabRoute.values
        .map(
          (route) => NavigationDestination(
            label: route.label,
            icon: FaIcon(route.icon),
            selectedIcon: FaIcon(route.selectedIcon, color: selectedColor),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        NavigationBar(
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: _labelTextStyle(context),
          selectedIndex: selectedIndex,
          onDestinationSelected:
              (index) => _onDestinationSelected(context, index),
          destinations: _destinations(context),
        ),
      ],
    );
  }
}
