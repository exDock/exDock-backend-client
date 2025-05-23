// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:exdock_backend_client/utils/HTTP/login_requests.dart';
import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void getWebsocketChannel(Uri wsUrl, ValueNotifier values) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? accessToken = await storage.read(key: "access_token");
  String? refreshToken = await storage.read(key: "refresh_token");
  var channel = WebSocketChannel.connect(wsUrl);
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
          await refreshTokens(refreshToken);
          accessToken = await storage.read(key: "access_token");
          channel.sink.add(
            jsonEncode(
              {
                "type": "authenticate",
                "token": accessToken,
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
