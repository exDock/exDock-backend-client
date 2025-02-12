import 'package:exdock_backend_client/pages/catalog/category/edit/content/blocks/generate_block.dart';
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
  // TODO: split attribute blocks into two lists

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: widget.blocks.entries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: GenerateBlock(
                    block: widget.blocks.entries.toList()[index],
                    changeAttributeMap: widget.changeAttributeMap,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 24),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                height: 100,
                color: Colors.red,
                child: Placeholder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
