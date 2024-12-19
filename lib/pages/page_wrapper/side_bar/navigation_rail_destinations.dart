import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const Map<String, NavigationRailDestination> navigationRailDestinations = {
  "/home": NavigationRailDestination(
    icon: Icon(Icons.home_rounded),
    label: Text("home"),
  ),
  "/sales": NavigationRailDestination(
    icon: Icon(Symbols.request_quote_rounded),
    label: Text("sales"),
  ),
  "/catalog": NavigationRailDestination(
    icon: Icon(Symbols.package_2_rounded),
    label: Text("catalog"),
  ),
  "/customers": NavigationRailDestination(
    icon: Icon(Symbols.emoji_people_rounded),
    label: Text("customers"),
  ),
  "/marketing": NavigationRailDestination(
    icon: Icon(Symbols.campaign_sharp),
    label: Text("marketing"),
  ),
  "/content": NavigationRailDestination(
    icon: Icon(Symbols.newspaper_rounded),
    label: Text("content"),
  ),
  "/reports": NavigationRailDestination(
    icon: Icon(Symbols.monitoring_rounded),
    label: Text("reports"),
  ),
  "/stores": NavigationRailDestination(
    icon: Icon(Symbols.storefront_rounded),
    label: Text("stores"),
  ),
  "/system": NavigationRailDestination(
    icon: Icon(Symbols.host_rounded),
    label: Text("system"),
  ),
};
