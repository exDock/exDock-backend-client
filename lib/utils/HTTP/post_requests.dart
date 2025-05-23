// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

// Project imports:
import 'package:exdock_backend_client/utils/HTTP/http_data.dart';
import 'package:exdock_backend_client/utils/HTTP/login_requests.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';

Future<HttpData> standardPostRequest(String endpoint, String body) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  int statusCode;
  String responseBody = "";
  String? accessToken = await storage.read(key: "access_token");
  String? refreshToken = await storage.read(key: "refresh_token");

  // TODO: add server from config
  Uri uri = Uri.http("127.0.0.1", endpoint);
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
