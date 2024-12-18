import 'package:exdock_backend_client/pages/page_wrapper/side_bar.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/top_bar.dart';
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
                  child: Column(
                    children: [
                      const TopBar(
                        height: 100,
                        pageName: "testPageName",
                        breadCrumbs: "test > bread > crumbs",
                      ),
                      Expanded(child: child),
                    ],
                  ),
                ),
              ),
              const SideBar(width: 100),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) =>
                const Placeholder(child: Center(child: Text("root")))),
        GoRoute(
            path: '/home', builder: (context, state) => const Placeholder()),
      ],
    ),
  ],
);
