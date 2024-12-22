import 'package:flutter/material.dart';

// Custom ChangeNotifier for a String value
class StringNotifier extends ChangeNotifier {
  String _value;

  StringNotifier(this._value);

  String get value => _value;

  set value(String newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners();
    }
  }
}

String path = Uri.base.path;
StringNotifier pathNotifier = StringNotifier(Uri.base.path);
