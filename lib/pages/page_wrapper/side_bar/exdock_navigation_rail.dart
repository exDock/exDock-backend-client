import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  late OverlayState overlayState;

  @override
  Widget build(BuildContext context) {
    overlayState = Overlay.of(context);
    return NavigationRail(
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
        return NavigationRailDestination(
          icon: MouseRegion(
            onEnter: (_) => setState(() {
              // hoveredIndex = entry.key;
              showOverlay(entry.key);
            }),
            child: entry.value.icon,
          ),
          label: entry.value.label,
        );
      }).toList(),
    );
  }

  void showOverlay(int index) {
    overlayState.insert(
      OverlayEntry(
        builder: (context) => Positioned(
          left: 100,
          top: 100,
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: 200, // TODO: remove for dynamic
            decoration: BoxDecoration(color: Colors.deepOrange),
            child: Column(
              children: _getMenuItemsForDestination(index),
            ),
          ),
        ),
      ),
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
