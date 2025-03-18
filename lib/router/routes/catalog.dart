import 'package:exdock_backend_client/pages/catalog/category/category.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/product.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      path: '/catalog/category/:selectedCategory',
      builder: (context, state) {
        int? categoryId;
        try {
          categoryId = int.parse(state.pathParameters['selectedCategory']!);
        } catch (_) {}
        return Category(
          selectedCategory: categoryId,
        );
      },
    ),
    GoRoute(
      path: '/catalog/product/:selectedProduct',
      builder: (context, state) {
        int? productId;
        try {
          productId = int.parse(state.pathParameters['selectedProduct']!);
        } catch (_) {}
        return ProductInfo(
          productId: productId,
        );
      },
    ),
  ];
}
