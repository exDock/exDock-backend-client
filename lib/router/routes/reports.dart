import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getReportsRoutes() {
  return [
    GoRoute(
      path: '/reports',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
