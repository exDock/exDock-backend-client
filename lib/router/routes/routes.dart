import 'package:exdock_backend_client/router/routes/catalog.dart';
import 'package:exdock_backend_client/router/routes/content.dart';
import 'package:exdock_backend_client/router/routes/customers.dart';
import 'package:exdock_backend_client/router/routes/home.dart';
import 'package:exdock_backend_client/router/routes/marketing.dart';
import 'package:exdock_backend_client/router/routes/reports.dart';
import 'package:exdock_backend_client/router/routes/sales.dart';
import 'package:exdock_backend_client/router/routes/stores.dart';
import 'package:exdock_backend_client/router/routes/system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> getRoutes() {
  return [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const Placeholder(child: Center(child: Text("root"))),
    ),
    ...getHomeRoutes(),
    ...getSalesRoutes(),
    ...getCatalogRoutes(),
    ...getCustomersRoutes(),
    ...getMarketingRoutes(),
    ...getContentRoutes(),
    ...getReportsRoutes(),
    ...getStoresRoutes(),
    ...getSystemRoutes(),
  ];
}
