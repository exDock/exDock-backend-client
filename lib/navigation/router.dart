import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../auth/login.dart';
import '../main.dart';

final GoRouter goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: "/",
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(title: "ExDock");
          }),
      GoRoute(
          path: "/login",
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          }),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      FlutterSecureStorage storage = FlutterSecureStorage();
      String? token = await storage.read(key: "jwt");
      if (token == null) {
        return "/login";
      } else {
        return null;
      }
    });
