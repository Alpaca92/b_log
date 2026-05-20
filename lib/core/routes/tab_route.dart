import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

enum TabRoute {
  feed(
    label: 'Feed',
    path: '/feed',
    icon: FontAwesomeIcons.images,
    selectedIcon: FontAwesomeIcons.solidImages,
  ),
  calendar(
    label: 'Calendar',
    path: '/calendar',
    icon: FontAwesomeIcons.calendarDays,
    selectedIcon: FontAwesomeIcons.solidCalendarDays,
  ),
  profile(
    label: 'Profile',
    path: '/profile',
    icon: FontAwesomeIcons.circleUser,
    selectedIcon: FontAwesomeIcons.solidCircleUser,
  );

  const TabRoute({
    required this.label,
    required this.path,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final String path;
  final IconData icon;
  final IconData selectedIcon;

  NavigationDestination toDestination(Color selectedColor) {
    return NavigationDestination(
      label: label,
      icon: FaIcon(icon),
      selectedIcon: FaIcon(selectedIcon, color: selectedColor),
    );
  }
}

class TabRouteWidget extends StatelessWidget {
  const TabRouteWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  void _onDestinationSelected(BuildContext context, int index) {
    final route = TabRoute.values[index];
    context.go(route.path);
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

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.primary;

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
          destinations:
              TabRoute.values
                  .map((route) => route.toDestination(selectedColor))
                  .toList(),
        ),
      ],
    );
  }
}
