// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

List<GoRoute> getSalesRoutes() {
  return [
    GoRoute(
      path: '/sales',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
