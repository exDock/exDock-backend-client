// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// Project imports:
import 'package:exdock_backoffice/utils/HTTP/login_requests.dart';
import 'package:exdock_backoffice/utils/authentication/authentication_data.dart';

// Project imports:

void getWebsocketChannel(Uri wsUrl, ValueNotifier values) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: "access_token");
  final String? refreshToken = await storage.read(key: "refresh_token");
  if (wsUrl.scheme != "ws" && wsUrl.scheme != "wss") {
    throw NotAuthenticatedException(
        "Invalid WebSocket URL scheme: ${wsUrl.scheme}");
  }
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
      final Map<String, dynamic> data = jsonDecode(message);
      if (data["type"] == "auth_success") {
        isAuthenticated = true;
      } else if (data["type"] == "auth_failure") {
        if (isFirstAttempt) {
          isFirstAttempt = false;
          if (refreshToken == null) {
            // Error is already handled by the authentication function
            channel.sink.close(1000, "No refresh token found");
            return;
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
          // If the authentication fails again, close the channel
          channel.sink.close(1000, "Authentication failed");
          return;
        }
      } else {
        if (!isAuthenticated) {
          // If the message is received before authentication is successful, close the channel
          channel.sink.close(1000, "Not authenticated");
          return;
        }
        final Map<String, dynamic> data = jsonDecode(message);
        switch (data["type"]) {
          case "errorNotification":
            final List<String> existingValues = List<String>.from(values.value);
            final String errorMessage = data["error"]["errorMessage"];
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

extension UriExtension on Uri {
  Uri convertToWs() {
    if (scheme == "http") {
      return replace(scheme: "ws");
    } else {
      return replace(scheme: "wss");
    }
  }
}
