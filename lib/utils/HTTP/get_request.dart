// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:exdock_backend_client/utils/HTTP/HttpData.dart';

Future<HttpData> standardGetRequest(String endpoint) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  int statusCode = 404;
  String responseBody = "";
  String? token = await storage.read(key: "jwt");

  // TODO: add server from config
  Uri uri = Uri.http("127.0.0.1", endpoint);
  if (token == null) {
    return HttpData(statusCode: 401, responseBody: null);
  }

  try {
    http.Response response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    statusCode = response.statusCode;
    responseBody = String.fromCharCodes(response.bodyBytes);
  } catch (_) {
    return HttpData(statusCode: 404, responseBody: "");
  }

  return HttpData(statusCode: statusCode, responseBody: responseBody);
}
