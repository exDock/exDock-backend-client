// Flutter imports:
import 'dart:convert';

import 'package:exdock_backend_client/pages/system/system_synchronous.dart';
import 'package:exdock_backend_client/utils/HTTP/get_request.dart';
import 'package:exdock_backend_client/utils/HTTP/http_data.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';
import 'package:flutter/material.dart';

class System extends StatefulWidget {
  const System({super.key});

  @override
  State<System> createState() => _SystemState();
}

class _SystemState extends State<System> {
  Future<Map<String, dynamic>> getSystemData() async {
    // Simulate a network request or data fetching
    HttpData httpData = await standardGetRequest("/api/v1/system/test");

    if (httpData.statusCode != 200) {
      throw Exception("Failed to load system data");
    }

    return jsonDecode(httpData.responseBody!) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSystemData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading system data"));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SystemSynchronous(
              blocks: snapshot.data!,
              changeSettingsMap: MapNotifier(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
