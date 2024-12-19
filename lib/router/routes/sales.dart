import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getSalesRoutes() {
  return [
    GoRoute(
      path: '/sales',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
