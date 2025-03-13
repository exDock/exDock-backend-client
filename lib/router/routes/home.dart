import 'package:exdock_backend_client/pages/home/home.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getHomeRoutes() {
  return [
    GoRoute(path: '/home', builder: (context, state) => const Home()),
  ];
}
