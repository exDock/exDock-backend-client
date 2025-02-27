import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar_hover_menu.dart';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar_hover_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoverable_navigation_rail/hoverable_navigation_rail.dart';
import 'package:hoverable_navigation_rail/hoverable_navigation_rail_destination.dart';
import 'dart:async';

import 'navigation_rail_destinations.dart';

class ExDockNavigationRail extends StatefulWidget {
  const ExDockNavigationRail({super.key});

  @override
  State<ExDockNavigationRail> createState() => _ExDockNavigationRailState();
}

class _ExDockNavigationRailState extends State<ExDockNavigationRail> {
  final SideBarHoverMenuData sideBarHoverMenuData = SideBarHoverMenuData(
      false,
      false,
      OverlayState(), // temporary
      null,
      null,
      null);
  int selectedIndex = 0;

  @override
  void dispose() {
    sideBarHoverMenuData.dismissTimer?.cancel();
    removeHoverMenuOverlay(sideBarHoverMenuData);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sideBarHoverMenuData.overlayState = Overlay.of(context);
    return HoverableNavigationRail(
      labelType: NavigationRailLabelType.all,
      selectedIndex: selectedIndex,
      onDestinationSelected: (newIndex) {
        setState(() {
          selectedIndex = newIndex;
          context.push(navigationRailDestinations.keys.toList()[newIndex]);
        });
      },
      destinations: navigationRailDestinations.values
          .toList()
          .asMap()
          .entries
          .map((entry) {
        return HoverableNavigationRailDestination(
          onHoverStateChange: onHoverStateChangeHoverMenu(
            sideBarHoverMenuData,
            entry.key,
            context,
          ),
          icon: entry.value.icon,
          label: entry.value.label,
        );
      }).toList(),
    );
  }
}
