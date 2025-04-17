// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:exdock_backend_client/pages/home/home.dart';

List<GoRoute> getHomeRoutes() {
  return [
    GoRoute(path: '/home', builder: (context, state) => const Home()),
  ];
}
