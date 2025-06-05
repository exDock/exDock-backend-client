// Flutter imports:
import 'dart:convert';

import 'package:exdock_backend_client/pages/system/blocks/generate_system_block.dart';
import 'package:exdock_backend_client/pages/system/blocks/system_block.dart';
import 'package:exdock_backend_client/pages/system/top_bar/system_top_bar.dart';
import 'package:exdock_backend_client/utils/HTTP/post_requests.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';
import 'package:flutter/material.dart';

class SystemSynchronous extends StatelessWidget {
  const SystemSynchronous({
    super.key,
    required this.blocks,
    required this.changeSettingsMap,
  });

  final Map<String, dynamic> blocks;
  final MapNotifier changeSettingsMap;

  @override
  Widget build(BuildContext context) {
    MapNotifier changeSettingsMap = MapNotifier();
    List<MapEntry<String, dynamic>> blocksEntriesList = blocks.entries.toList();

    void saveValues() async {
      Map<String, dynamic> serverRequestMap = {};
      for (var entry in changeSettingsMap.value.entries) {
        if (entry.value != null) {
          serverRequestMap[entry.key] = entry.value;
        }
      }

      if (serverRequestMap.isNotEmpty) {
        // serverRequestMap = await settings.setSettings(serverRequestMap);
        changeSettingsMap.value.clear();

        var response = await standardPostRequest(
          "/api/v1/system/setSettings",
          jsonEncode(serverRequestMap),
        );

        if (response.statusCode == 200) {
          changeSettingsMap.reset();
        } else {
          // Handle error response
          print("Error saving settings: ${response.responseBody}");
        }
      }
    }

    return Stack(
      children: [
        SystemTopBar(
          name: "Settings",
          saveNotifier: changeSettingsMap,
          saveValues: saveValues,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SystemBlock(
            block: List<Widget>.generate(
              blocks.length,
              (index) {
                return GenerateSystemBlock(
                  block: blocksEntriesList[index],
                  changeSettingsMap: changeSettingsMap,
                );
              },
            ),
            changeSettingsMap: changeSettingsMap,
          ),
        )
      ].reversed.toList(),
    );
  }
}
