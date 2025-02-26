import 'package:flutter/material.dart';
import 'package:hoverable_navigation_rail/hoverable_navigation_rail_destination.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

Map<String, HoverableNavigationRailDestination> navigationRailDestinations = {
  "/home": HoverableNavigationRailDestination(
    icon: Icon(Icons.home_rounded),
    label: Text("home"),
  ),
  "/sales": HoverableNavigationRailDestination(
    icon: Icon(Symbols.request_quote_rounded),
    label: Text("sales"),
  ),
  "/catalog": HoverableNavigationRailDestination(
    icon: Icon(Symbols.package_2_rounded),
    label: Text("catalog"),
  ),
  "/customers": HoverableNavigationRailDestination(
    icon: Icon(Symbols.emoji_people_rounded),
    label: Text("customers"),
  ),
  "/marketing": HoverableNavigationRailDestination(
    icon: Icon(Symbols.campaign_sharp),
    label: Text("marketing"),
  ),
  "/content": HoverableNavigationRailDestination(
    icon: Icon(Symbols.newspaper_rounded),
    label: Text("content"),
  ),
  "/reports": HoverableNavigationRailDestination(
    icon: Icon(Symbols.monitoring_rounded),
    label: Text("reports"),
  ),
  "/stores": HoverableNavigationRailDestination(
    icon: Icon(Symbols.storefront_rounded),
    label: Text("stores"),
  ),
  "/system": HoverableNavigationRailDestination(
    icon: Icon(Symbols.host_rounded),
    label: Text("system"),
  ),
};
