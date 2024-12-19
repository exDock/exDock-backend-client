import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getHomeRoutes() {
  return [
    GoRoute(path: '/home', builder: (context, state) => const Placeholder()),
  ];
}
