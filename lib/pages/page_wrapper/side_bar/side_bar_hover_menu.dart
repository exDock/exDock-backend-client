import 'dart:async';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar_hover_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:exdock_backend_client/globals/globals.dart';
import 'package:go_router/go_router.dart';

import 'navigation_rail_destinations.dart';

void removeHoverMenuOverlay(SideBarHoverMenuData sideBarHoverMenuData) {
  sideBarHoverMenuData.overlayEntry?.remove();
  sideBarHoverMenuData.overlayEntry = null;
}

void showHoverMenuOverlay(
  SideBarHoverMenuData sideBarHoverMenuData,
  Widget child,
) {
  removeHoverMenuOverlay(
      sideBarHoverMenuData); // Remove any existing overlay first

  sideBarHoverMenuData.overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      left: 100,
      top: 100,
      child: MouseRegion(
        onEnter: (_) {
          sideBarHoverMenuData.isHoveringMenu = true;
        },
        onExit: (_) {
          sideBarHoverMenuData.isHoveringMenu = false;
          startHoverMenuDismissTimer(sideBarHoverMenuData);
        },
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          decoration: BoxDecoration(
            color: darkColour,
          ),
          child: child,
        ),
      ),
    ),
  );

  sideBarHoverMenuData.overlayState.insert(sideBarHoverMenuData.overlayEntry!);
}

void startHoverMenuDismissTimer(SideBarHoverMenuData sideBarHoverMenuData) {
  sideBarHoverMenuData.dismissTimer?.cancel();
  sideBarHoverMenuData.dismissTimer =
      Timer(const Duration(milliseconds: 250), () {
    if (!sideBarHoverMenuData.isHoveringMenu &&
        !sideBarHoverMenuData.isHoveringButton) {
      removeHoverMenuOverlay(sideBarHoverMenuData);
    }
  });
}

Function(bool isHovering) onHoverStateChangeHoverMenu(
  SideBarHoverMenuData sideBarHoverMenuData,
  int newHoveredIndex,
  BuildContext context,
) {
  return (bool isHovering) {
    if (isHovering) {
      sideBarHoverMenuData.hoveredIndex = newHoveredIndex;
      sideBarHoverMenuData.isHoveringButton = true;
      showHoverMenuOverlay(
        sideBarHoverMenuData,
        SizedBox(
          width: 200,
          child: Column(
            children: _getMenuItemsForDestination(newHoveredIndex, context),
          ),
        ),
      );
    } else {
      sideBarHoverMenuData.isHoveringButton = false;
      startHoverMenuDismissTimer(sideBarHoverMenuData);
    }
  };
}

List<Widget> _getMenuItemsForDestination(int index, BuildContext context) {
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
        _buildMenuItem('Orders', '/sales/orders', context),
        _buildMenuItem('Invoices', '/sales/invoices', context),
        _buildMenuItem('Shipments', '/sales/shipments', context),
        _buildMenuItem('Credit Memos', '/sales/credit-memos', context),
        _buildMenuItem('Returns', '/sales/returns', context),
      ]);
    case '/catalog':
      menuItems.addAll([
        _buildMenuItem('Products', '/catalog/products', context),
        _buildMenuItem('Categories', '/catalog/categories', context),
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

Widget _buildMenuItem(String label, String route, BuildContext context) {
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
