import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:flutter/material.dart';

class FilterNotifier extends ValueNotifier<Map<String, Filter>> {
  FilterNotifier() : super({});

  void addFilter(Filter newValue) {
    value[newValue.key] = newValue;
    notifyListeners();
  }

  /// Returns true if the filter was existed
  bool removeFilter(String key) {
    bool output = value.remove(key) != null;
    notifyListeners();
    return output;
  }

  void reset() {
    value.clear();
    notifyListeners();
  }
}
