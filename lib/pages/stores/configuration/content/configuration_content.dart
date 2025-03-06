import 'package:exdock_backend_client/pages/stores/configuration/content/configuration_content_synchronous.dart';
import 'package:exdock_backend_client/widgets/loading/exdock_loading_page_animation.dart';
import 'package:flutter/material.dart';

class ConfigurationContent extends StatelessWidget {
  const ConfigurationContent({super.key, required this.configurationDataKey});

  final String? configurationDataKey;

  Future<Map<String, Map<String, dynamic>>> getConfigurationSettings(
    String configKey,
  ) async {
    await Future.delayed(Duration(seconds: 1));
    return {};
  }

  @override
  Widget build(BuildContext context) {
    if (configurationDataKey == null) {
      return Center(
        child: Text("Please select a configuration"),
      );
    }

    return FutureBuilder(
      future: getConfigurationSettings(configurationDataKey!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("The following error happened: ${snapshot.error}"),
          );
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return ExdockLoadingPageAnimation();
        }

        return ConfigurationContentSynchronous(
          configurationSettings: snapshot.data!,
        );
      },
    );
  }
}
