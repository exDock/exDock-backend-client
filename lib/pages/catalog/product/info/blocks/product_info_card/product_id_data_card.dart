// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/pages/catalog/product/info/id_data/category_list.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_card/product_info_card_title.dart';
import 'package:exdock_backend_client/utils/attributes/generate_attribute.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';

class IdDataBlock extends StatefulWidget {
  const IdDataBlock({
    super.key,
    required this.block,
    required this.changeAttributeMap,
  });

  final MapEntry<String, dynamic> block;
  final MapNotifier changeAttributeMap;

  @override
  State<IdDataBlock> createState() => _IdDataBlockState();
}

class _IdDataBlockState extends State<IdDataBlock> {
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

    widget.changeAttributeMap.addListener(
      () {
        unsavedChangesNotifier.value =
            widget.changeAttributeMap.attributeChanged(
          getAttributesList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> categories = widget.block.value['product_categories'];
    List<String> categoryNames = categories.map((element) {
      return element as String;
    }).toList();

    return ProductInfoCardTitle(
      title: widget.block.key,
      unsavedChangesNotifier: unsavedChangesNotifier,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.block.value['attributes'].length,
            itemBuilder: (context, index) {
              Widget child = GenerateAttribute(
                attribute: widget.block.value['attributes'][index],
                changeAttributeMap: widget.changeAttributeMap,
              );
              if (index != 0) {
                child = Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: child,
                );
              }
              return child;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: CategoryList(categories: categoryNames),
          )
        ],
      ),
    );
  }
}
