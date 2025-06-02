import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  final SharedPreferencesWithCache _settings;

  Settings(this._settings);

  String getSetting<T>(String key) {
    switch (T.toString()) {
      case "String":
        return _settings.getString(key) ?? '';
      case "int":
        return _settings.getInt(key)?.toString() ?? '0';
      case "double":
        return _settings.getDouble(key)?.toString() ?? '0.0';
      case "bool":
        return _settings.getBool(key)?.toString() ?? 'false';
      case "dynamic":
        return _settings.getString(key) ?? '';
      default:
        throw ArgumentError('Unsupported type: $T');
    }
  }

  void setSetting<T>(String key, T value) {
    switch (T.toString()) {
      case "String":
        _settings.setString(key, value as String);
        break;
      case "int":
        _settings.setInt(key, value as int);
        break;
      case "double":
        _settings.setDouble(key, value as double);
        break;
      case "bool":
        _settings.setBool(key, value as bool);
        break;
      default:
        throw ArgumentError('Unsupported type: $T');
    }
  }

  Future<bool> containsSetting(String key) async {
    return _settings.containsKey(key);
  }

  List<String> getSettingKeys() {
    return _settings.keys.toList();
  }

  Future<void> clearSettings() async {
    await _settings.clear();
  }

  Future<void> removeSetting(String key) async {
    await _settings.remove(key);
  }

  Future<Map<String, dynamic>> setSettings(
      Map<String, dynamic> settingsMap) async {
    Map<String, dynamic> settings = {};
    for (var entry in settingsMap.entries) {
      bool exists = await containsSetting(entry.key);
      if (exists) {
        setSetting(entry.key, entry.value);
      } else {
        settings[entry.key] = entry.value;
      }
    }

    return settings;
  }
}
