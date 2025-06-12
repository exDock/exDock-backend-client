// Package imports:
// Project imports:
import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/utils/settings.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> applicationStartUp() async {
  SharedPreferencesWithCacheOptions preferencesWithCacheOptions =
      const SharedPreferencesWithCacheOptions();

  prefs = await SharedPreferencesWithCache.create(
    cacheOptions: preferencesWithCacheOptions,
  );
  String jsonConfig = await rootBundle.loadString("assets/config.json");
  settings = Settings(jsonConfig);
}
