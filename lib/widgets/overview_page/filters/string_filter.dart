import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';

class StringFilter extends Filter {
  StringFilter({required super.name, required super.key, required this.value});

  String value;

  @override
  MapEntry<String, dynamic> get filterParameter => MapEntry(key, value);
}
