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

    if (configKey == 'checkout') {
      return {
        "Checkout options": {
          "block_type": "standard",
          "attributes": [
            {
              "attribute_type": "switch",
              "attribute_id": "enable_onepage_checkout",
              "attribute_name": "Enable Onepage Checkout",
              "current_value": false,
            },
            {
              "attribute_type": "switch",
              "attribute_id": "allow_guest_checkout",
              "attribute_name": "Allow Guest Checkout",
              "current_value": true,
            },
            {
              "attribute_type": "switch",
              "attribute_id": "enable_terms_conditions",
              "attribute_name": "Enable Terms & Conditions",
              "current_value": true,
            },
            {
              "attribute_type": "int",
              "attribute_id": "max_no_items_in_order_summary",
              "attribute_name":
                  "Maximum Number of Items to Display in Order Summary",
              "current_value": 10,
            },
          ],
        },
        "Shopping cart": {
          "block_type": "standard",
          "attributes": [
            {
              "attribute_type": "switch",
              "attribute_id": "after_add_product_redirect_to_cart",
              "attribute_name":
                  "After Adding a Product Redirect to Shopping Cart",
              "current_value": false,
            },
            {
              "attribute_type": "dropdown",
              "attribute_id": "configurable_product_image_in_cart",
              "attribute_name":
                  "Image to show for configurable product in cart",
              "possible_values": [
                {
                  'value': 'simple_product_thumbnail',
                  'label': 'Simple product thumbnail',
                },
                {
                  'value': 'configurable_product_thumbnail',
                  'label': 'Configurable product thumbnail',
                },
              ],
              "current_value": {
                'value': 'configurable_product_thumbnail',
                'label': 'Configurable product thumbnail',
              },
            },
          ],
        },
      };
    }

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
