// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:exdock_backend_client/router/router.dart';
import 'package:exdock_backend_client/utils/startup.dart';

void main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  await applicationStartUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'exDock backend client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff264653)),
        cardColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
