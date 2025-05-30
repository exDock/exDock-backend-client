// Package imports:
// Project imports:
import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:exdock_backend_client/utils/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> applicationStartUp() async {
  prefs = await SharedPreferences.getInstance();
  authData = AuthenticationData(); // uses prefs

  settings = Settings(); // uses prefs

  // Initialize default settings
  settings.registerSetting("baseUrl", "http://127.0.0.1");
}
