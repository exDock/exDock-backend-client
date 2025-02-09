import 'package:exdock_backend_client/pages/catalog/category/edit/content/blocks/generate_block.dart';
import 'package:flutter/material.dart';

class CategoryEditContentBlocks extends StatefulWidget {
  const CategoryEditContentBlocks({super.key, required this.blocks});

  final Map<String, dynamic> blocks;

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
                  child: SizedBox(
                    height: 20,
                    child: GenerateBlock(
                      block: widget.blocks.entries.toList()[index],
                    ),
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
