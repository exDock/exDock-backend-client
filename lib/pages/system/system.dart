// Flutter imports:
import 'package:exdock_backend_client/pages/system/system_synchronous.dart';
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
    await Future.delayed(const Duration(seconds: 2));
    return {
      "Back Office settings": {
        "block_type": "standard",
        "attributes": [
          {
            "attribute_id": "backend_url",
            "attribute_name": "Backend URL",
            "attribute_type": "text",
            "current_attribute_value": "127.0.0.1",
          }
        ]
      },
      "Backend settings": {"block_type": "standard", "attributes": []},
    };
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
