// Flutter imports:
// Project imports:
import 'package:exdock_backend_client/utils/settings.dart';
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

StringNotifier pathNotifier = StringNotifier(Uri.base.path);

late final Settings settings;
