import 'dart:convert';

import 'package:exdock_backend_client/utils/authentication/authentication_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void getWebsocketChannel(String url, ValueNotifier values) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  // String? accessToken = await storage.read(key: "access_token");
  // String? refreshToken = await storage.read(key: "refresh_token");
  String? accessToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdXRob3JpemF0aW9ucyI6W10sImlhdCI6MTc0NzA1NjAxNSwiZXhwIjoxNzQ3MDU2OTE1LCJpc3MiOiJleERvY2siLCJzdWIiOiIyIn0.WJ3L7T2q_w3ujUEkrBruuA5NWzq0vF84jLMj4Ps29GxgDIMIEo2awbIgLyx777yxLE9WfNjb-P1X5RSJVe50jw54f5Hkh8xy1Yv_3GZx4iRVZ2DqGzJGZ1fDNfYmPJ_TGzBOPSqmgxCgYNEdEUIONqlhT1Rir0Vl4Romqux9DR44vVObPxL1_sRhiMsMdpTr58_8g7ujAdaMpdq9WqIv1xIWnNUkq31AhGGoTtomQuEpPoZu9Okrnv1n5xeiH8pMbswRYRqk0k4WnY0EvVY0waAl4SdtzaZDbmx5u98M5o0swrDhcf7DwaxpsJWXHmnZ36sqtiq8Ey8N9_yjVAqtkLJlRy2-bXAHXYQJ4ogAWlmbQHnV35Y6tYFGG87JdpebFxGFMiMSnnYQmRWQ8HB4-Lgf7T_t9ByErV7QP0ZXNQZiI737av0NfCXISx_HlmZA2MMw_rHvh0h8mDf_oT7jUQbGnCbbsCOmYSzguMnDuFwmfDRYMMGqLZlHcpnKTOPr";
  String? refreshToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJqdGktMWJjM2IwNjMtMTkyNy00ZWY0LTlkMWUtMDJiZTYwMWUwZmE5IiwiaWF0IjoxNzQ3MDU2MDE1LCJleHAiOjE3NDc2NjA4MTUsImlzcyI6ImV4RG9jayIsInN1YiI6IjIifQ.NfrrJkkzTcyP5hOu7hxxtsLVYooWYm8YVjn8zoFzPZaficFMxMo-e0r7OAU6oTciuGahpou0A1XK-3W7nprggh8fPDQmKoLB_JH-xHQDGmr2ZMGLq_l9ZEEnBJQich6p0ECa-ZYZhXtV9M5g90VMRP0v8tnQ71gs8F9ozyrmhTufCgUfK_rTAEVjryuAaSnynA0t32bBWHMRLYJy9yLRysKqvl5RlTkXK0mKx_fENI0CroIYk_5U6gYm04i3oyqx1gL-uXs2i3oX6u5QtapdTNVmNs6GtctmoQUSiragwbiUH7QchAPUSkfUMmsQzbL3ZOthpxGlvydx7o65DRGWyaV-0_fc3uyUCcwcnny-GFcy-IF1LxASk0eiCYLaoRy6H8D0Wb6agJJCuL3GG-Cg6W5gx-x6pCp-623HvccAtTVqR1AICMBrdFOR-WKegdepzdceJv7NqDWQGzNUgggVAp55coX7rM_BO8z8MdS_MsbbVoMOK2aIqeglOsrVhA7c";
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
        print("Received message: $message");
        List<dynamic> existingValues = values.value;
        existingValues.add(message.toString());
        values.value = existingValues;
      }
    },
    onError: (error) {
      channel.sink.close(1000, "WebSocket error: $error");
    },
    cancelOnError: true,
  );
}
