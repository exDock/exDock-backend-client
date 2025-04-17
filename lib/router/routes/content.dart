// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:exdock_backend_client/pages/content/pages/pages_overview.dart';

List<GoRoute> getContentRoutes() {
  return [
    GoRoute(
      path: '/content',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/content/pages',
      builder: (context, state) => const PagesOverview(),
    ),
  ];
}
