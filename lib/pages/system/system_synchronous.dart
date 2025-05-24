// Flutter imports:
import 'package:exdock_backend_client/pages/system/blocks/generate_system_block.dart';
import 'package:exdock_backend_client/pages/system/blocks/system_block.dart';
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

    return Stack(
      children: [
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
