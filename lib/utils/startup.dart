import 'package:exdock_backend_client/globals/variables.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> applicationStartUp() async {
  prefs = await SharedPreferences.getInstance();
  authData = AuthenticationData(); // uses prefs
}
