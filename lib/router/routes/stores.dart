// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

List<GoRoute> getStoresRoutes() {
  return [
    GoRoute(
      path: '/stores',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
