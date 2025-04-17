// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

List<GoRoute> getCustomersRoutes() {
  return [
    GoRoute(
      path: '/customers',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
