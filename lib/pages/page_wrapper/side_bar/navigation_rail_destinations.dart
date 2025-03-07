import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar_hover_menu.dart';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/side_bar_hover_menu_data.dart';
import 'package:exdock_backend_client/pages/page_wrapper/side_bar/simple_hover_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:hoverable_navigation_rail/hoverable_navigation_rail_destination.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

Map<String, HoverableNavigationRailDestination> navigationRailDestinations(
  BuildContext context,
  SideBarHoverMenuData sideBarHoverMenuData,
) {
  noHoverMenuOnHoverStateChange(isHovered) {
    if (isHovered) removeHoverMenuOverlay(sideBarHoverMenuData);
  }

  return {
    "/home": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Icons.home_rounded),
      label: Text("home"),
    ),
    "/sales": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Symbols.request_quote_rounded),
      label: Text("sales"),
    ),
    "/catalog": HoverableNavigationRailDestination(
      onHoverStateChange: onHoverStateChangeHoverMenu(
        sideBarHoverMenuData,
        context,
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  "Catalog",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SimpleHoverMenuButton(
                route: "/catalog/category",
                buttonText: "category",
              ),
              SimpleHoverMenuButton(
                route: "/catalog/product",
                buttonText: "product",
              ),
            ],
          ),
        ),
      ),
      icon: Icon(Symbols.package_2_rounded),
      label: Text("catalog"),
    ),
    "/customers": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Symbols.emoji_people_rounded),
      label: Text("customers"),
    ),
    "/marketing": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Symbols.campaign_sharp),
      label: Text("marketing"),
    ),
    "/content": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Symbols.newspaper_rounded),
      label: Text("content"),
    ),
    "/reports": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Symbols.monitoring_rounded),
      label: Text("reports"),
    ),
    "/stores": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Symbols.storefront_rounded),
      label: Text("stores"),
    ),
    "/system": HoverableNavigationRailDestination(
      onHoverStateChange: noHoverMenuOnHoverStateChange,
      icon: Icon(Symbols.host_rounded),
      label: Text("system"),
    ),
  };
}
