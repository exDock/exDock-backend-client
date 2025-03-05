import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/pages/login/login.dart';
import 'package:exdock_backend_client/pages/page_wrapper/scope.dart';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/top_bar.dart';
import 'package:exdock_backend_client/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    ShellRoute(
      builder: (context, GoRouterState state, child) {
        // TODO: check if logged in
        pathNotifier.value = state.uri.path;
        return Scaffold(
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Stack(
                        children: [
                          child,
                          Align(
                            alignment: Alignment.topLeft,
                            child: Scope(),
                          ),
                        ],
                      ),
                    ),
                    const TopBar(
                      height: 100,
                    ),
                  ],
                ),
              ),
              const SideBar(width: 100),
            ],
          ),
        );
      },
      routes: getRoutes(),
    ),
  ],
);
