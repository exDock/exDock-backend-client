import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:exdock_backend_client/utils/map_notifier.dart';

class ProductInfoBlock extends StatefulWidget {
  const ProductInfoBlock({
    super.key,
    required this.block,
    required this.changeAttributeMap,
  });

  final List<Widget> block;
  final MapNotifier changeAttributeMap;

  @override
  State<ProductInfoBlock> createState() => _ProductInfoBlockState();
}

class _ProductInfoBlockState extends State<ProductInfoBlock> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.all(24),
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: widget.block.length,
      itemBuilder: (content, index) {
        return widget.block[index];
      },
    );
  }
}
