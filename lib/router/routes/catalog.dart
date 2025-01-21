import 'package:exdock_backend_client/pages/catalog/category/category.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_synchronous.dart';
import 'package:exdock_backend_client/pages/catalog/products/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    GoRoute(
      path: '/catalog/category',
      builder: (context, state) => Category(),
    ),
    GoRoute(
        path: '/catalog/product/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return ProductInfoSynchronous();
        }),
  ];
}
