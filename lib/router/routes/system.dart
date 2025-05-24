// Flutter imports:
import 'package:exdock_backend_client/pages/system/system.dart';
// Package imports:
import 'package:go_router/go_router.dart';

List<GoRoute> getSystemRoutes() {
  return [
    GoRoute(
      path: '/system',
      builder: (context, state) => const System(),
    ),
  ];
}
