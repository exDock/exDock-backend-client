// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';

Future<void> applicationStartUp() async {
  prefs = await SharedPreferences.getInstance();
  authData = AuthenticationData(); // uses prefs
}
