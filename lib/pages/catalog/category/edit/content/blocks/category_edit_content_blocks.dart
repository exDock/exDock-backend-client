import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryEditContentBlocks extends StatefulWidget {
  const CategoryEditContentBlocks({
    super.key,
    required this.blocks,
    required this.changeAttributeMap,
  });

  final List<Widget> blocks;
  final MapNotifier changeAttributeMap;

  @override
  State<CategoryEditContentBlocks> createState() =>
      _CategoryEditContentBlocksState();
}

class _CategoryEditContentBlocksState extends State<CategoryEditContentBlocks> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.all(24),
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: widget.blocks.length,
      itemBuilder: (context, index) {
        return widget.blocks[index];
      },
    );
  }
}
