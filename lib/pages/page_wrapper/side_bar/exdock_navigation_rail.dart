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
  int selectedIndex = 0;
  int? hoveredIndex;
  bool isHoveringMenu = false;
  bool isHoveringButton = false;
  late OverlayState overlayState;
  OverlayEntry? _overlayEntry;
  Timer? _dismissTimer;

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _removeOverlay();
    super.dispose();
  }

  void _startDismissTimer() {
    _dismissTimer?.cancel();
    _dismissTimer = Timer(const Duration(milliseconds: 250), () {
      if (!isHoveringMenu && !isHoveringButton) {
        _removeOverlay();
      }
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    overlayState = Overlay.of(context);
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
              setState(() {
                hoveredIndex = entry.key;
                isHoveringButton = true;
                showOverlay(entry.key);
              });
            } else {
              setState(() {
                isHoveringButton = false;
                _startDismissTimer();
              });
            }
          },
          icon: entry.value.icon,
          label: entry.value.label,
        );
      }).toList(),
    );
  }

  void showOverlay(int index) {
    _removeOverlay(); // Remove any existing overlay first

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: 100,
        top: 100,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isHoveringMenu = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHoveringMenu = false;
              _startDismissTimer();
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: 200, // TODO: remove for dynamic
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: _getMenuItemsForDestination(index),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(_overlayEntry!);
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
          style: Theme.of(context).textTheme.titleMedium,
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
          _buildMenuItem('Inventory', '/catalog/inventory'),
          _buildMenuItem('Shared Catalogs', '/catalog/shared'),
        ]);
      case '/customers':
        menuItems.addAll([
          _buildMenuItem('All Customers', '/customers/all'),
          _buildMenuItem('Now Online', '/customers/online'),
          _buildMenuItem('Customer Groups', '/customers/groups'),
          _buildMenuItem('Segments', '/customers/segments'),
        ]);
      default:
        menuItems.add(
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'No submenu available',
              style: Theme.of(context).textTheme.bodyMedium,
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
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
