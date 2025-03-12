import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/utils/blocks/generate_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ConfigurationContentSynchronous extends StatefulWidget {
  const ConfigurationContentSynchronous({
    super.key,
    required this.configurationSettings,
  });

  final Map<String, Map<String, dynamic>> configurationSettings;

  @override
  State<ConfigurationContentSynchronous> createState() =>
      _ConfigurationContentSynchronousState();
}

class _ConfigurationContentSynchronousState
    extends State<ConfigurationContentSynchronous> {
  final MapNotifier changeAttributeMap = MapNotifier();

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, Map<String, dynamic>>> configBlocks =
        widget.configurationSettings.entries.toList();

    return Align(
      alignment: Alignment.topCenter,
      child: MasonryGridView.count(
        padding: const EdgeInsets.all(24),
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: configBlocks.length,
        itemBuilder: (context, index) {
          return GenerateBlock(
            block: configBlocks[index],
            changeAttributeMap: changeAttributeMap,
          );
        },
      ),
    );
  }
}
