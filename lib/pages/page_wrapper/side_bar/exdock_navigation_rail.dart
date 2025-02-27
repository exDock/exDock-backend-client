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
      null);
  int selectedIndex = 0;
  int? hoveredIndex;

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
          onHoverStateChange: (isHovering) {
            if (isHovering) {
              hoveredIndex = entry.key;
              sideBarHoverMenuData.isHoveringButton = true;
              showHoverMenuOverlay(
                sideBarHoverMenuData,
                SizedBox(
                  width: 200,
                  child: Column(
                    children: _getMenuItemsForDestination(entry.key),
                  ),
                ),
              );
            } else {
              sideBarHoverMenuData.isHoveringButton = false;
              startHoverMenuDismissTimer(sideBarHoverMenuData);
            }
          },
          icon: entry.value.icon,
          label: entry.value.label,
        );
      }).toList(),
    );
  }

  List<Widget> _getMenuItemsForDestination(int index) {
    final String route = navigationRailDestinations.keys.toList()[index];
    final List<Widget> menuItems = [];

    menuItems.add(
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Text(
          (navigationRailDestinations.values.toList()[index].label as Text)
                  .data ??
              "",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );

    switch (route) {
      case '/sales':
        menuItems.addAll([
          _buildMenuItem('Orders', '/sales/orders'),
          _buildMenuItem('Invoices', '/sales/invoices'),
          _buildMenuItem('Shipments', '/sales/shipments'),
          _buildMenuItem('Credit Memos', '/sales/credit-memos'),
          _buildMenuItem('Returns', '/sales/returns'),
        ]);
      case '/catalog':
        menuItems.addAll([
          _buildMenuItem('Products', '/catalog/products'),
          _buildMenuItem('Categories', '/catalog/categories'),
        ]);
      default:
        menuItems.add(
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'No submenu available',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        );
    }

    return menuItems;
  }

  Widget _buildMenuItem(String label, String route) {
    return MaterialButton(
      onPressed: () => context.push(route),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
