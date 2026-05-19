import 'package:b_log/core/routes/tab_route.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    required this.currentIndex,
    required this.title,
    required this.body,
    super.key,
  });

  final int currentIndex;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
      bottomNavigationBar: TabRouteWidget(selectedIndex: currentIndex),
    );
  }
}
