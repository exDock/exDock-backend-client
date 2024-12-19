import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getSystemRoutes() {
  return [
    GoRoute(
      path: '/system',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
