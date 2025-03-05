import 'package:exdock_backend_client/globals/variables.dart';

class AuthenticationData {
  String? _authEmail;
  String? _authPassword;

  AuthenticationData() {
    _authEmail = prefs.getString('authEmail');
    _authPassword = prefs.getString('authPassword');
  }

  get email {
    if (_authEmail != null) return _authEmail!;
    _authEmail = prefs.getString('authEmail');
    if (_authEmail != null) return _authEmail!;
    Exception('No email set');
  }

  get password {
    if (_authPassword != null) return _authPassword!;
    _authPassword = prefs.getString('authPassword');
    if (_authPassword != null) return _authPassword!;
    Exception('No password set');
  }

  void setAuthEmail(String val) async {
    _authEmail = val;
    await prefs.setString('authEmail', val);
  }

  void setAuthPassword(String val) async {
    _authPassword = val;
    await prefs.setString('authPassword', val);
  }
}
