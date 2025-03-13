import 'package:exdock_backend_client/globals/styling.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_save_button.dart';
import 'package:flutter/material.dart';

class ConfigurationSaveWidget extends StatelessWidget {
  const ConfigurationSaveWidget({
    super.key,
    required this.somethingToSaveNotifier,
  });

  final MapNotifier somethingToSaveNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        width: (MediaQuery.of(context).size.width - 100 - 250 - 3 * 24) / 2,
        decoration: BoxDecoration(
          color: darkColour,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(12),
          ),
          boxShadow: kBoxShadowList,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: ExDockSaveButton(
                somethingToSaveNotifier: somethingToSaveNotifier,
                onPressed: () {
                  // TODO: Save the configuration
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
