import 'package:exdock_backend_client/pages/catalog/category/edit/content/category_edit_content_attribute_list_builder.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class CategoryEditContentBlocks extends StatefulWidget {
  const CategoryEditContentBlocks({
    super.key,
    required this.blocks,
    required this.changeAttributeMap,
  });

  final Map<String, dynamic> blocks;
  final MapNotifier changeAttributeMap;

  @override
  State<CategoryEditContentBlocks> createState() =>
      _CategoryEditContentBlocksState();
}

class _CategoryEditContentBlocksState extends State<CategoryEditContentBlocks> {
  List<MapEntry<String, dynamic>> oddEntries = [];
  List<MapEntry<String, dynamic>> evenEntries = [];

  @override
  void initState() {
    // TODO: make it so that the next block is added to the list with the lowest height
    int index = 0;
    for (var entry in widget.blocks.entries) {
      index++; // Start index from 1 for odd/even check

      if (index % 2 == 1) {
        // Check if index is odd
        oddEntries.add(entry);
      } else {
        // Index is even
        evenEntries.add(entry);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: CategoryEditContentAttributeListBuilder(
                blocks: oddEntries,
                changeAttributeMap: widget.changeAttributeMap,
                childrenPadding:
                    const EdgeInsets.only(top: 24, left: 24, right: 12),
              ),
            ),
            // SizedBox(width: 24),
            Flexible(
              child: CategoryEditContentAttributeListBuilder(
                blocks: evenEntries,
                changeAttributeMap: widget.changeAttributeMap,
                childrenPadding:
                    const EdgeInsets.only(top: 24, left: 12, right: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
