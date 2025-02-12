import 'package:exdock_backend_client/pages/catalog/category/edit/content/blocks/category_edit_content_blocks.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class CategoryEditContentSynchronous extends StatefulWidget {
  const CategoryEditContentSynchronous({
    super.key,
    required this.blocks,
    required this.changeAttributeMap,
  });

  final Map<String, dynamic> blocks;
  final MapNotifier changeAttributeMap;

  @override
  State<CategoryEditContentSynchronous> createState() =>
      _CategoryEditContentSynchronousState();
}

class _CategoryEditContentSynchronousState
    extends State<CategoryEditContentSynchronous> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CategoryEditContentBlocks(
        blocks: widget.blocks,
        changeAttributeMap: widget.changeAttributeMap,
      ),
    );
  }
}
