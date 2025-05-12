import 'dart:convert';

import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void getWebsocketChannel(String url, ValueNotifier values) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: "access_token");
  String? refreshToken = await storage.read(key: "refresh_token");
  final wsUrl = Uri.parse(url);
  final channel = WebSocketChannel.connect(wsUrl);
  bool isFirstAttempt = true;
  bool isAuthenticated = false;

  if (accessToken == null) {
    channel.sink.close(1000, "No access token found");
    throw NotAuthenticatedException("No access token found");
  }

  channel.sink.add(jsonEncode({
    "type": "authenticate",
    "token": accessToken,
  }));

  channel.stream.listen(
    (message) async {
      Map<String, dynamic> data = jsonDecode(message);
      if (data["type"] == "auth_success") {
        isAuthenticated = true;
      } else if (data["type"] == "auth_failure") {
        if (isFirstAttempt) {
          isFirstAttempt = false;
          if (refreshToken == null) {
            channel.sink.close(1000, "No refresh token found");
            throw NotAuthenticatedException("No refresh token found");
          }
          channel.sink.add(
            jsonEncode(
              {
                "type": "authenticate",
                "token": refreshToken,
              },
            ),
          );
        } else {
          channel.sink.close(1000, "Authentication failed");
          throw NotAuthenticatedException("Authentication failed");
        }
      } else {
        if (!isAuthenticated) {
          channel.sink.close(1000, "Not authenticated");
          throw NotAuthenticatedException("Not authenticated");
        }
        Map<String, dynamic> data = jsonDecode(message);
        switch (data["type"]) {
          case "errorNotification":
            List<String> existingValues = List<String>.from(values.value);
            String errorMessage = data["error"]["errorMessage"];
            existingValues.add(errorMessage);
            values.value = existingValues;
            break;
        }
      }
    },
    onError: (error) {
      channel.sink.close(1000, "WebSocket error: $error");
    },
    cancelOnError: true,
  );
}
