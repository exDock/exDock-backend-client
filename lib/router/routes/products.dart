import 'package:go_router/go_router.dart';

import '../../pages/products/product.dart';

List<GoRoute> getProductsRoutes() {
  return [
    GoRoute(
      path: '/products',
      builder: (context, state) => Product(),
    ),
  ];
}
