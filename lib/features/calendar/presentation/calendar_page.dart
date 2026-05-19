import 'package:b_log/core/layout/main_scaffold.dart';
import 'package:b_log/core/routes/tab_route.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: TabRoute.calendar.index,
      title: TabRoute.calendar.label,
      body: const Text('Calendar View'),
    );
  }
}
