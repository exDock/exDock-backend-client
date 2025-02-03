import 'package:exdock_backend_client/pages/catalog/category/category.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/catalog/product/info/product_info.dart';
import '../../pages/catalog/product/new/new_product.dart';

List<GoRoute> getCatalogRoutes() {
  return [
    GoRoute(
      path: '/catalog',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/catalog/product',
      builder: (context, state) => Product(),
    ),
    GoRoute(
      path: '/catalog/category',
      builder: (context, state) => Category(),
    ),
    GoRoute(
      path: '/catalog/product/info/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ProductInfo();
      },
    ),
    GoRoute(
      path: "/catalog/product/new",
      builder: (context, state) => NewProduct(),
    )
  ];
}
