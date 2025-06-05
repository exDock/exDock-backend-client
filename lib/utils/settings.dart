import 'package:localstorage/localstorage.dart';

class Settings {
  Settings();
  Map<String, dynamic> oldSettings = {};

  T getSetting<T>(String key) {
    try {
      return localStorage.getItem(key) as T;
    } catch (e) {
      return ""
          as T; // Return an empty string or a default value if the key does not exist
    }
  }

  void setSetting<T>(String key, T value) {
    return localStorage.setItem(key, value.toString());
  }

  bool containsSetting(String key) {
    return localStorage.getItem(key) != null;
  }

  List<String> getSettingKeys() {
    List<String> keys = [];
    for (var i = 0; i < localStorage.length; i++) {
      String key = localStorage.key(i)!;
      if (key.startsWith("Flutter") || key.startsWith("exdock_")) {
        continue; // Skip keys that start with "exdock_" or "Flutter"
      }
      keys.add(localStorage.key(i)!);
    }

    return keys;
  }

  Map<String, dynamic> setSettings(Map<String, dynamic> settings) {
    List<String> keys = getSettingKeys();
    for (var entry in settings.entries) {
      if (!keys.contains(entry.key)) {
        continue; // Skip if the key is not in the settings map
      }
      if (localStorage.getItem(entry.key) != null) {
        oldSettings[entry.key] = localStorage.getItem(entry.key);
      }
      setSetting(entry.key, entry.value);
    }
    return settings; // Return the updated settings map
  }

  void restoreSettings() {
    for (var entry in oldSettings.entries) {
      setSetting(entry.key, entry.value);
    }
  }

  void removeOldSettings() {
    oldSettings = {};
  }
}
