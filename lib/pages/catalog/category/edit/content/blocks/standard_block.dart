import 'package:exdock_backend_client/pages/catalog/attributes/generate_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/content/group_cards/category_edit_group_card_with_title.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class StandardBlock extends StatefulWidget {
  const StandardBlock(
      {super.key, required this.block, required this.changeAttributeMap});

  final MapEntry<String, dynamic> block;
  final MapNotifier changeAttributeMap;

  @override
  State<StandardBlock> createState() => _StandardBlockState();
}

class _StandardBlockState extends State<StandardBlock> {
  late final ValueNotifier<bool> unsavedChangesNotifier =
      ValueNotifier<bool>(false);

  List<String> getAttributesList() {
    return List<String>.from(
      widget.block.value['attributes'].map((e) => e["attribute_id"]).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.changeAttributeMap.addListener(() {
      unsavedChangesNotifier.value = widget.changeAttributeMap.attributeChanged(
        getAttributesList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CategoryEditGroupCardWithTitle(
      title: widget.block.key,
      unsavedChangesNotifier: unsavedChangesNotifier,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.block.value['attributes'].length,
        itemBuilder: (context, index) {
          if (widget.block.value['attributes'][index] != null) {
            return GenerateAttribute(
              attribute: widget.block.value['attributes'][index],
              changeAttributeMap: widget.changeAttributeMap,
            );
          }
          return SizedBox(height: 50, child: Placeholder());
        },
      ),
    );
  }
}
