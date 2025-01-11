import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/catalog/products/product.dart';

List<GoRoute> getCatalogRoutes() {
  return [
    GoRoute(
      path: '/catalog',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/catalog/products',
      builder: (context, state) => Product(),
    ),
  ];
}
