import 'dart:io';

import 'package:exdock_backend_client/utils/HTTP/HttpData.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import 'login_requests.dart';

Future<HttpData> standardGetRequest(String endpoint) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  int statusCode = 404;
  String responseBody = "";
  String? accessToken = await storage.read(key: "access_token");
  String? refreshToken = await storage.read(key: "refresh_token");

  // TODO: add server from config
  Uri uri = Uri.http("127.0.0.1", endpoint);
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
    responseBody = String.fromCharCodes(response.bodyBytes);
  } catch (_) {
    return HttpData(statusCode: 404, responseBody: "");
  }

  return HttpData(statusCode: statusCode, responseBody: responseBody);
}
