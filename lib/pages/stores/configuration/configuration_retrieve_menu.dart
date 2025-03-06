import 'package:exdock_backend_client/pages/stores/configuration/configuration_menu_sub_type.dart';

Map<String, List<ConfigurationMenuSubType>> getConfigurationMenu(
  Function(String) switchToConfigurationsSettingsPage,
) {
  return {
    'General': [],
    'Catalog': [],
    'Customers': [],
    'Sales': [
      ConfigurationMenuSubType(
        title: 'orders',
        onPressed: () {
          switchToConfigurationsSettingsPage('orders');
        },
      ),
      ConfigurationMenuSubType(
        title: 'shipments',
        onPressed: () {
          switchToConfigurationsSettingsPage('shipments');
        },
      ),
      ConfigurationMenuSubType(
        title: 'tax',
        onPressed: () {
          switchToConfigurationsSettingsPage('tax');
        },
      ),
      ConfigurationMenuSubType(
        title: 'checkout',
        onPressed: () {
          switchToConfigurationsSettingsPage('checkout');
        },
      ),
      ConfigurationMenuSubType(
        title: 'payments',
        onPressed: () {
          switchToConfigurationsSettingsPage('payments');
        },
      ),
    ],
    'Services': [],
  };
}
