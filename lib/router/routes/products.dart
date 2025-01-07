import 'package:go_router/go_router.dart';

import '../../pages/catalog/products/product.dart';

List<GoRoute> getProductsRoutes() {
  return [
    GoRoute(
      path: '/catalog/products',
      builder: (context, state) => Product(),
    ),
  ];
}
