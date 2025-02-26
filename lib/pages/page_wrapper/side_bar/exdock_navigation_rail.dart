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

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow content to overflow
      children: [
        NavigationRail(
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
                onEnter: (_) => setState(() => hoveredIndex = entry.key),
                child: entry.value.icon,
              ),
              label: entry.value.label,
            );
          }).toList(),
        ),
        if (hoveredIndex != null)
          Positioned(
            left: 72,
            top: _calculateMenuPosition(hoveredIndex!),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHoveringMenu = true),
              onExit: (_) => setState(() {
                isHoveringMenu = false;
                hoveredIndex = null;
              }),
              child: _buildHoverMenu(hoveredIndex!),
            ),
          ),
      ],
    );
  }

  double _calculateMenuPosition(int index) {
    const double itemHeight = 72.0;
    const double initialOffset = 8.0;
    return initialOffset + (itemHeight * index);
  }

  Widget _buildHoverMenu(int index) {
    return Card(
      elevation: 4,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 200,
          maxWidth: 300,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: _getMenuItemsForDestination(index),
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
    return InkWell(
      onTap: () => context.push(route),
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
