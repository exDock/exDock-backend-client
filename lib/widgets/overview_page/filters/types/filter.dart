abstract class FilterData {
  const FilterData({
    required this.name,
    required this.key,
  });

  /// The name of the filter
  final String name;

  /// The key of the filter
  final String key;

  /// Returns the parameter that is added to the request
  MapEntry<String, dynamic> get filterParameter;

  String get displayValue;
}
