import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class UnsavedChangesOverlay extends StatefulWidget {
  const UnsavedChangesOverlay({
    super.key,
    required this.unsavedChangesNotifier,
  });

  final ValueNotifier<bool> unsavedChangesNotifier;

  @override
  State<UnsavedChangesOverlay> createState() => _UnsavedChangesOverlayState();
}

class _UnsavedChangesOverlayState extends State<UnsavedChangesOverlay> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ValueListenableBuilder(
        valueListenable: widget.unsavedChangesNotifier,
        builder: (context, value, child) {
          if (!value) {
            return SizedBox();
          }
          return Container(
            height: 36,
            decoration: BoxDecoration(
              color: darkColour,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5)),
              boxShadow: kBoxShadowList,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "unsaved changes",
                    style: TextStyle(color: Theme.of(context).canvasColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
