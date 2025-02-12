import 'package:flutter/material.dart';

class MapNotifier extends ValueNotifier<Map<String, dynamic>> {
  MapNotifier() : super({});

  void addEntry(String key, dynamic newValue) {
    value[key] = newValue;
    notifyListeners();
  }

  void removeEntry(String key) {
    value.remove(key);
    notifyListeners();
  }

  bool get isEmpty => value.isEmpty;
}
