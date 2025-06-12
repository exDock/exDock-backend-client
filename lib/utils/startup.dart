// Package imports:

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/utils/settings.dart';

Future<void> applicationStartUp() async {
  SharedPreferencesWithCacheOptions preferencesWithCacheOptions =
      const SharedPreferencesWithCacheOptions();

  prefs = await SharedPreferencesWithCache.create(
    cacheOptions: preferencesWithCacheOptions,
  );
  String jsonConfig = await rootBundle.loadString("assets/config.json");
  settings = Settings(jsonConfig);
}
