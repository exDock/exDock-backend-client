import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getCustomersRoutes() {
  return [
    GoRoute(
      path: '/customers',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
