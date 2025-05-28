import 'package:exdock_backend_client/widgets/overview_page/filters/filter_setup/filter_setup_type_data.dart';

class FilterSetupData {
  FilterSetupData({
    required this.key,
    this.name,
    required this.type,
  });

  final String key;
  final String? name;
  final FilterSetupTypeData type;
}
