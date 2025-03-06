import 'package:exdock_backend_client/pages/stores/configuration/configuration_menu_sub_type.dart';

Map<String, List<ConfigurationMenuSubType>> getConfigurationMenu() {
  return {
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
}
