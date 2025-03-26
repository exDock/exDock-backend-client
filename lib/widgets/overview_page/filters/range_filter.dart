import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';

class RangeFilter extends Filter {
  RangeFilter({
    required super.name,
    required super.key,
    this.min,
    this.max,
  });

  num? min;
  num? max;

  @override
  MapEntry<String, dynamic> get filterParameter {
    Map<String, num?> value = {};

    if (min != null) value['min'] = min;
    if (max != null) value['max'] = max;

    return MapEntry(key, value);
  }

  @override
  String get displayValue => "$min - $max";
}
