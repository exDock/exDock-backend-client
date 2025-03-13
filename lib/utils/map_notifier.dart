import 'package:flutter/material.dart';

class MapNotifier extends ValueNotifier<Map<String, dynamic>> {
  MapNotifier() : super({});

  void addEntry(String key, dynamic newValue) {
    value[key] = newValue;
    notifyListeners();
  }

  void updateEntry(String key, dynamic originalValue, dynamic newValue) {
    if (originalValue == newValue) {
      return removeEntry(key);
    }
    value[key] = newValue;
    notifyListeners();
  }

  /// Same as updateEntry,
  /// but it automatically takes the key and originalValue from the attribute
  ///
  /// - [key]: [attribute['attribute_id'&rsqb;]<br>
  /// - [originalValue]: [attribute['current_attribute_value'&rsqb;]
  void updateAttributeEntry(Map<String, dynamic> attribute, value) {
    updateEntry(
      attribute['attribute_id'],
      attribute['current_attribute_value'],
      value,
    );
  }

  void removeEntry(String key) {
    value.remove(key);
    notifyListeners();
  }

  void reset() {
    value.clear();
    notifyListeners();
  }

  bool attributeChanged(List<String> attributes) {
    return attributes.any(value.keys.contains);
  }

  bool get isEmpty => value.isEmpty;
}
