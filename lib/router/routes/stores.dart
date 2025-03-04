import 'package:exdock_backend_client/pages/stores/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getStoresRoutes() {
  return [
    GoRoute(
      path: '/stores',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/stores/configuration',
      builder: (context, state) => const Configuration(),
    ),
  ];
}
