import 'package:exdock_backend_client/pages/stores/configuration/configuration_retrieve_menu.dart';
import 'package:exdock_backend_client/pages/stores/configuration/configuration_side_bar.dart';
import 'package:flutter/material.dart';

class Configuration extends StatelessWidget {
  const Configuration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConfigurationSidebar(menuItems: getConfigurationMenu()),
        Expanded(
          child: Center(
            child: Text("configuration content"),
          ),
        ),
      ],
    );
  }
}
