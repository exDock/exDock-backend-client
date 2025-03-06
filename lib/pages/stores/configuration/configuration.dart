import 'package:exdock_backend_client/pages/stores/configuration/configuration_retrieve_menu.dart';
import 'package:exdock_backend_client/pages/stores/configuration/configuration_side_bar.dart';
import 'package:exdock_backend_client/pages/stores/configuration/content/configuration_content.dart';
import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  String? configKey;

  void switchToConfigurationsSettingsPage(String configurationDataKey) {
    setState(() {
      configKey = configurationDataKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConfigurationSidebar(
          menuItems: getConfigurationMenu(switchToConfigurationsSettingsPage),
        ),
        Expanded(
          child: ConfigurationContent(configurationDataKey: configKey),
        ),
      ],
    );
  }
}
