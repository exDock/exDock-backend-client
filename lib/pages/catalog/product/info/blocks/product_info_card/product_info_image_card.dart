// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/globals/styling.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_card/product_info_card_title.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';

class ProductInfoImageCard extends StatefulWidget {
  const ProductInfoImageCard({
    super.key,
    required this.block,
    required this.changeAttributeMap,
  });

  final MapEntry<String, dynamic> block;
  final MapNotifier changeAttributeMap;

  @override
  State<ProductInfoImageCard> createState() => _ProductInfoImageCardState();
}

class _ProductInfoImageCardState extends State<ProductInfoImageCard> {
  late final ValueNotifier<bool> unsavedChangesNotifier =
      ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    widget.changeAttributeMap.addListener(() {
      unsavedChangesNotifier.value = widget.changeAttributeMap.attributeChanged(
        ["product_image"],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> images =
        widget.block.value['images'].map((image) {
      return image as Map<String, dynamic>;
    }).toList();
    final List<Widget> imageWidgets = [];
    for (var image in images) {
      final List<String> extensions =
          jsonDecode(image['extensions']).map((extension) {
        return extension as String;
      }).toList();
      imageWidgets.add(
        Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 200,
                minHeight: 200,
                minWidth: 200,
              ),
              child: Image.network(
                fit: BoxFit.contain,
                image['image_url'],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 24),
              height: 200,
              width: 200,
              child: ListView.builder(
                itemCount: extensions.length,
                itemBuilder: (content, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: lightKBoxShadowList,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(extensions[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return ProductInfoCardTitle(
      title: widget.block.key,
      unsavedChangesNotifier: unsavedChangesNotifier,
      child: SizedBox(
        child: Wrap(
          spacing: 10,
          runSpacing: 5,
          direction: Axis.horizontal,
          children: imageWidgets,
        ),
      ),
    );
  }
}
