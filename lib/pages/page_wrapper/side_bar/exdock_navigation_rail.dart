import 'package:exdock_backend_client/pages/page_wrapper/side_bar/navigation_rail_destinations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExDockNavigationRail extends StatefulWidget {
  const ExDockNavigationRail({super.key});

  @override
  State<ExDockNavigationRail> createState() => _ExDockNavigationRailState();
}

class _ExDockNavigationRailState extends State<ExDockNavigationRail> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      selectedIndex: selectedIndex,
      onDestinationSelected: (newIndex) {
        setState(() {
          selectedIndex = newIndex;
          context.push(navigationRailDestinations.keys.toList()[newIndex]);
        });
      },
      destinations: navigationRailDestinations.values.toList(),
    );
  }
}
