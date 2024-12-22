import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getCatalogRoutes() {
  return [
    GoRoute(
      path: '/catalog',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/catalog/category',
      builder: (context, state) => const Placeholder(),
    ),
  ];
}
