// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:exdock_backend_client/globals/variables.dart';
// Project imports:
import 'package:exdock_backend_client/utils/HTTP/http_data.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<HttpData> loginRequest(String email, String password) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  int statusCode;
  String baseUrl = settings.getSetting<String>("base_url");

  Uri uri = Uri.parse("$baseUrl/api/v1/token");
  try {
    http.Response response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {"email": email, "password": password},
      ),
    );

    statusCode = response.statusCode;

    if (statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Map<String, dynamic> tokens = jsonDecode(data["tokens"]);
      String accessToken = tokens["access_token"];
      String refreshToken = tokens["refresh_token"];

      await storage.write(key: "access_token", value: accessToken);
      await storage.write(key: "refresh_token", value: refreshToken);
    }
  } catch (error) {
    throw Exception("Error making login request: $error");
  }

  return HttpData(statusCode: statusCode, responseBody: null);
}

Future<String> refreshTokens(String refreshToken) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String baseUrl = settings.getSetting<String>("base_url");
  Uri uri = Uri.parse("$baseUrl/api/v1/refresh");
  try {
    http.Response response = await http.post(
      uri,
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {"refresh_token": refreshToken},
      ),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    await storage.write(key: "access_token", value: data["access_token"]);

    return data["access_token"];
  } catch (_) {
    throw NotAuthenticatedException("Failed to refresh tokens");
  }
}
