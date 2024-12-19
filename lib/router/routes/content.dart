import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getContentRoutes() {
  return [
    GoRoute(
      path: '/content',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
