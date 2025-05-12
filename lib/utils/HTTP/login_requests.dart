import 'dart:convert';

import 'package:exdock_backend_client/utils/HTTP/HttpData.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<HttpData> loginRequest(AuthenticationData authData) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  int statusCode = 404;
  String baseUrl = "http://127.0.0.1:80";

  // TODO: add server from config
  Uri uri = Uri.parse("$baseUrl/api/v1/token");
  try {
    http.Response response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {"email": authData.email, "password": authData.password},
      ),
    );
    print(response.statusCode);

    statusCode = response.statusCode;

    if (statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Map<String, dynamic> tokens = data["tokens"];
      String accessToken = tokens["access_token"];
      String refreshToken = tokens["refresh_token"];

      storage.write(key: "access_token", value: accessToken);
      storage.write(key: "refresh_token", value: refreshToken);
    }
  } catch (error) {
    if (kDebugMode) {
      print(error);
    }
  }

  return HttpData(statusCode: statusCode, responseBody: null);
}

Future<String> refreshTokens(String refreshToken) async {
  // TODO: add server from config
  String baseUrl = "http://127.0.0.1";
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
    return data["access_token"];
  } catch (_) {
    throw NotAuthenticatedException("Failed to refresh tokens");
  }
}
