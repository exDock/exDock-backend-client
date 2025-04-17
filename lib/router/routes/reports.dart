// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

List<GoRoute> getReportsRoutes() {
  return [
    GoRoute(
      path: '/reports',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
