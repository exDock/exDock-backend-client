// Flutter imports:
import 'dart:convert';

import 'package:exdock_backend_client/globals/variables.dart';
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
    HttpData httpData = await standardGetRequest("/api/v1/system/getSettings");

    Map<String, dynamic> backOfficeSettings = {
      "BackOffice Settings": {
        "block_type": "standard",
        "attributes": [
          generateBackendAttribute(
            "backend_url",
            "Backend URL",
            "text",
            settings.getSetting("baseUrl"),
          ),
        ]
      },
    };

    Map<String, dynamic> jsonData =
        jsonDecode(httpData.responseBody!) as Map<String, dynamic>;
    jsonData.addAll(backOfficeSettings);

    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSystemData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Placeholder();
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

Map<String, dynamic> generateBackendAttribute(
    String id, String name, String type, dynamic value) {
  return {
    "attribute_id": id,
    "attribute_name": name,
    "attribute_type": type,
    "current_attribute_value": value,
  };
}
