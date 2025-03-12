import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_card/unsaved_changes_overlay.dart';
import 'package:flutter/material.dart';

class CategoryEditGroupCard extends StatelessWidget {
  const CategoryEditGroupCard({
    super.key,
    this.width = double.infinity,
    required this.unsavedChangesNotifier,
    required this.child,
  });

  final double width;
  final ValueNotifier<bool> unsavedChangesNotifier;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: kBoxShadowList,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: child,
          ),
          UnsavedChangesOverlay(unsavedChangesNotifier: unsavedChangesNotifier),
        ],
      ),
    );
  }
}
