// Dart imports:
import 'dart:io';

// Package imports:
import 'package:exdock_backend_client/globals/variables.dart';
// Project imports:
import 'package:exdock_backend_client/utils/HTTP/http_data.dart';
import 'package:exdock_backend_client/utils/HTTP/login_requests.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

Future<HttpData> standardGetRequest(String endpoint) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  int statusCode;
  String responseBody = "";
  String? accessToken = await storage.read(key: "access_token");
  String? refreshToken = await storage.read(key: "refresh_token");
  String baseUrl = settings.getSetting("backend_url");

  Uri uri = Uri.parse(baseUrl + endpoint);
  if (accessToken == null) {
    return HttpData(statusCode: 401, responseBody: null);
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
    http.Response response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'},
    );

    statusCode = response.statusCode;
    responseBody = response.body;
  } catch (e) {
    throw Exception("Error making GET request: $e");
  }

  return HttpData(statusCode: statusCode, responseBody: responseBody);
}
