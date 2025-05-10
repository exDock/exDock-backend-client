import 'dart:convert';

import 'package:exdock_backend_client/utils/HTTP/HttpData.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<HttpData> loginRequest(AuthenticationData authData) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  int statusCode = 404;

  // TODO: add server from config
  Uri uri = Uri.http("127.0.0.1", "/api/v1/token");
  try {
    http.Response response = await http.post(
      uri,
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {"email": authData.email, "password": authData.password},
      ),
    );

    statusCode = response.statusCode;
    print(String.fromCharCodes(response.bodyBytes));

    if (statusCode == 200) {
      await storage.write(key: "jwt", value: response.body);
    }
  } catch (_) {}

  return HttpData(statusCode: statusCode, responseBody: null);
}
