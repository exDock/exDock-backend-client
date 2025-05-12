import 'dart:convert';

import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Future<WebSocketChannel> getWebsocketChannel(String url) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: "access_token");
  String? refreshToken = await storage.read(key: "refresh_token");
  final wsUrl = Uri.parse(url);
  final channel = WebSocketChannel.connect(wsUrl);
  bool isAuthenticated = false;
  bool isFirstAttempt = true;

  if (accessToken == null) {
    throw NotAuthenticatedException("No access token found");
  }

  channel.stream.listen((message) {
    Map<String, dynamic> data = jsonDecode(message);
    if (data["type"] == "auth_success") {
      isAuthenticated = true;
    } else if (data["type"] == "auth_failure") {
      isAuthenticated = false;
      if (isFirstAttempt) {
        isFirstAttempt = false;
        if (refreshToken == null) {
          throw NotAuthenticatedException("No refresh token found");
        }
        channel.sink.add({
          "type": "authenticate",
          "token": refreshToken,
        });
      } else {
        throw NotAuthenticatedException("Authentication failed");
      }
    }
  });

  channel.sink.add({
    "type": "authenticate",
    "token": accessToken,
  });

  return Future.delayed(const Duration(seconds: 10), () {
    if (!isAuthenticated) {
      throw NotAuthenticatedException("Authentication timed out");
    } else {
      return channel;
    }
  });
}
