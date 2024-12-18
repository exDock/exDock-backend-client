import 'package:exdock_backend_client/pages/page_wrapper/scope.dart';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/top_bar.dart';
import 'package:exdock_backend_client/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (_, GoRouterState state, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Stack(
                    children: [
                      Expanded(
                        child: Padding(
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
                      ),
                      const TopBar(
                        height: 100,
                        pageName: "testPageName",
                        breadCrumbs: "test > bread > crumbs",
                      ),
                    ],
                  ),
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