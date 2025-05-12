// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

List<GoRoute> getSystemRoutes() {
  return [
    GoRoute(
      path: '/system',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
