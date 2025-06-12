// Dart imports:
import 'dart:io';

// Package imports:
import 'package:exdock_backoffice/globals/variables.dart';
// Project imports:
import 'package:exdock_backoffice/utils/HTTP/http_data.dart';
import 'package:exdock_backoffice/utils/HTTP/login_requests.dart';
import 'package:exdock_backoffice/utils/authentication/authentication_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

Future<HttpData> standardPostRequest(String endpoint, String body) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  int statusCode;
  String responseBody = "";
  String? accessToken = await storage.read(key: "access_token");
  String? refreshToken = await storage.read(key: "refresh_token");
  String baseUrl = settings.getSetting("base_url");

  Uri uri = Uri.parse("$baseUrl$endpoint");
  if (accessToken == null) {
    throw NotAuthenticatedException("No access token found");
  }

  if (JwtDecoder.isExpired(accessToken)) {
    if (refreshToken == null) {
      return HttpData(statusCode: 401, responseBody: null);
    }

    if (JwtDecoder.isExpired(refreshToken)) {
      throw NotAuthenticatedException("Refresh token expired");
    }

    accessToken = await refreshTokens(refreshToken);
  }

  try {
    http.Response response = await http.post(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'},
      body: body,
    );

    statusCode = response.statusCode;
    responseBody = String.fromCharCodes(response.bodyBytes);
  } catch (error) {
    throw Exception("Error making POST request: $error");
  }

  return HttpData(statusCode: statusCode, responseBody: responseBody);
}
