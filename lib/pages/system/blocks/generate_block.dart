// Flutter imports:
import 'package:exdock_backend_client/pages/system/blocks/standard_system_block.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';
import 'package:flutter/material.dart';

class GenerateBlock extends StatelessWidget {
  const GenerateBlock({
    super.key,
    required this.block,
    required this.changeSettingsMap,
  });

  final MapEntry<String, dynamic> block;
  final MapNotifier changeSettingsMap;

  @override
  Widget build(BuildContext context) {
    if (block.value["block_type"] == "standard") {
      return StandardSystemBlock(
        block: block,
        changeSettingsMap: changeSettingsMap,
      );
    }
    return Center(
      child: Text("Block type not recognised: ${block.value["block_type"]}"),
    );
  }
}
