// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

List<GoRoute> getMarketingRoutes() {
  return [
    GoRoute(
      path: '/marketing',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
