import 'package:exdock_backend_client/pages/stores/configuration/configuration_menu_sub_type.dart';
import 'package:exdock_backend_client/pages/stores/configuration/configuration_side_bar.dart';
import 'package:flutter/material.dart';

class Configuration extends StatelessWidget {
  const Configuration({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ConfigurationMenuSubType>> menuConfig = {
      'General': [],
      'Catalog': [],
      'Customers': [],
      'Sales': [
        ConfigurationMenuSubType(
          title: 'orders',
          onPressed: () {
            print('Orders pressed');
          },
        ),
        ConfigurationMenuSubType(
          title: 'shipments',
          onPressed: () {
            print('Shipments pressed');
          },
        ),
        ConfigurationMenuSubType(
          title: 'tax',
          onPressed: () {
            print('Tax pressed');
          },
        ),
        ConfigurationMenuSubType(
          title: 'checkout',
          onPressed: () {
            print('Checkout pressed');
          },
        ),
        ConfigurationMenuSubType(
          title: 'payments',
          onPressed: () {
            print('Payments pressed');
          },
        ),
      ],
      'Services': [],
    };

    return Row(
      children: [
        ConfigurationSidebar(menuItems: menuConfig),
        Expanded(
            child: Center(
          child: Text("configuration content"),
        ))
      ],
    );
  }
}
