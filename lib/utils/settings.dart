/// A singleton class to manage application settings.
class Settings {
  /// Private constructor to ensure singleton instance.
  static final Settings _instance = Settings._internal();

  /// Factory constructor to return the singleton instance.
  factory Settings() {
    return _instance;
  }

  /// Internal constructor for the singleton instance.
  Settings._internal();

  /// A map to hold all registered settings.
  final Map<String, Setting<dynamic>> _settings = {};

  /// Registers a new setting with a new [key] and a given [defaultValue].
  void registerSetting<T>(String key, T defaultValue) {
    if (!_settings.containsKey(key)) {
      _settings[key] = Setting<T>(defaultValue);
    }
  }

  /// Get a setting value by its [key].
  T getSettingValue<T>(String key) {
    if (_settings.containsKey(key)) {
      return _settings[key]!.currentValue as T;
    }
    throw Exception('Setting $key not found');
  }

  Setting<dynamic> getSetting(String key) {
    if (_settings.containsKey(key)) {
      return _settings[key]!;
    }
    throw Exception('Setting $key not found');
  }

  /// Set a new [value] for an existing setting by its [key].
  void setSetting<T>(String key, T value) {
    if (_settings.containsKey(key)) {
      _settings[key]!.currentValue = value;
    } else {
      throw Exception('Setting $key not found');
    }
  }

  /// Reset a value by its [key] to its default value.
  void resetSetting<T>(String key) {
    if (_settings.containsKey(key)) {
      _settings[key]!.currentValue = _settings[key]!.defaultValue;
    } else {
      throw Exception('Setting $key not found');
    }
  }

  /// Reset all settings to their default values.
  void resetAllSettings() {
    for (var key in _settings.keys) {
      _settings[key]!.currentValue = _settings[key]!.defaultValue;
    }
  }

  /// Check if a setting exists by its [key].
  bool hasSetting(String key) {
    return _settings.containsKey(key);
  }

  /// Remove a setting by its [key].
  void removeSetting(String key) {
    if (_settings.containsKey(key)) {
      _settings.remove(key);
    } else {
      throw Exception('Setting $key not found');
    }
  }

  /// Clear all settings.
  void clearSettings() {
    _settings.clear();
  }

  /// Get a list of all registered setting keys.
  List<String> getSettingKeys() {
    return _settings.keys.toList();
  }

  /// Load settings from a [settingsMap]
  void loadSettingsFromMap(Map<String, dynamic> settingsMap) {
    settingsMap.forEach((key, value) {
      if (_settings.containsKey(key)) {
        _settings[key]!.currentValue = value;
      } else {
        throw Exception('Setting $key not registered');
      }
    });
  }

  /// Save all settings to a map.
  Map<String, dynamic> saveSettingsToMap() {
    Map<String, dynamic> settingsMap = {};
    _settings.forEach((key, setting) {
      settingsMap[key] = setting.currentValue;
    });
    return settingsMap;
  }

  /// Register default settings from a map.
  void registerDefaultSettings(Map<String, dynamic> defaultSettings) {
    defaultSettings.forEach((key, value) {
      if (!_settings.containsKey(key)) {
        _settings[key] = Setting(value);
      }
    });
  }

  /// Save settings from a map and return the map without backoffice settings
  Map<String, dynamic> saveSettingsFromMap(Map<String, dynamic> settingsMap) {
    List<String> keys = getSettingKeys();
    Map<String, dynamic> backEndSettings = {};
    settingsMap.forEach(
      (key, value) {
        if (keys.contains(key)) {
          setSetting(key, value);
        } else {
          backEndSettings[key] = value;
        }
      },
    );

    return backEndSettings;
  }
}

/// A class representing a single setting with a [defaultValue] and [currentValue].
class Setting<T> {
  final T defaultValue;
  T currentValue;
  String clazz = T.runtimeType.toString();

  Setting(this.defaultValue) : currentValue = defaultValue;
}
