import 'package:exdock_backend_client/pages/catalog/category/edit/content/blocks/standard_block.dart';
import 'package:flutter/material.dart';

class GenerateBlock extends StatelessWidget {
  const GenerateBlock({super.key, required this.block});

  final MapEntry<String, dynamic> block;

  @override
  Widget build(BuildContext context) {
    if (block.value["block_type"] == "standard") {
      return StandardBlock(block: block);
    }
    return Center(
      child: Text("Block type not recognised: ${block.value["block_type"]}"),
    );
  }
}
