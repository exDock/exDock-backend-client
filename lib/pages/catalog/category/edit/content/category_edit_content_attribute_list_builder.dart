import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class CategoryEditContentAttributeListBuilder extends StatelessWidget {
  const CategoryEditContentAttributeListBuilder({
    super.key,
    required this.blocks,
    required this.changeAttributeMap,
    this.childrenPadding = const EdgeInsets.only(top: 24, left: 24, right: 24),
  });

  final List<Widget> blocks;
  final MapNotifier changeAttributeMap;
  final EdgeInsets childrenPadding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: blocks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: childrenPadding,
          child: blocks[index],
        );
      },
    );
  }
}
