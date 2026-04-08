import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';

class SsukSsukApp extends ConsumerWidget {
  const SsukSsukApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: '쑥쑥찰칵 MVP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF127C71)),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
