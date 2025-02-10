import 'package:exdock_backend_client/pages/catalog/attributes/generate_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/content/group_cards/category_edit_group_card_with_title.dart';
import 'package:flutter/material.dart';

class StandardBlock extends StatefulWidget {
  const StandardBlock({super.key, required this.block});

  final MapEntry<String, dynamic> block;

  @override
  State<StandardBlock> createState() => _StandardBlockState();
}

class _StandardBlockState extends State<StandardBlock> {
  @override
  Widget build(BuildContext context) {
    print("widget.block.key: ${widget.block.key}");
    print("widget.block.value: ${widget.block.value}");
    return CategoryEditGroupCardWithTitle(
      title: widget.block.key,
      unsavedChangesNotifier: ValueNotifier<bool>(true),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.block.value['attributes'].length,
        itemBuilder: (context, index) {
          if (widget.block.value['attributes'][index] != null) {
            return Container(
              height: 50,
              width: 50,
              color: Colors.orange,
              child: GenerateAttribute(
                attribute: widget.block.value['attributes'][index],
              ),
            );
          }
          return SizedBox(height: 50, child: Placeholder());
        },
      ),
    );
  }
}
