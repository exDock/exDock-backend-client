import 'package:exdock_backend_client/pages/catalog/product/home/widgets/blocks/middle_bar_block/middle_bar.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/blocks/product_list/product_list.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class GenerateBlock extends StatelessWidget {
  const GenerateBlock(
      {super.key, required this.block, required this.mapNotifier});

  final MapEntry<String, dynamic> block;
  final MapNotifier mapNotifier;

  @override
  Widget build(BuildContext context) {
    if (block.value["block_type"] == "product_home_middle_bar") {
      return MiddleBar(
        height: 150,
        block: block,
        mapNotifier: mapNotifier,
      );
    }
    if (block.value["block_type"] == "product_home_product_list") {
      return ProductList(
        block: block,
        mapNotifier: mapNotifier,
      );
    }
    return Center(
      child: Text("Block type not recognised: ${block.value["block_type"]}"),
    );
  }
}
