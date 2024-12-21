import 'package:exdock_backend_client/pages/products/top_bar/product_search.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getProductsRoutes() {
  return [
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductSearch(),
    ),
  ];
}
