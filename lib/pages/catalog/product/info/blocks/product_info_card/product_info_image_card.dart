import 'package:exdock_backend_client/pages/catalog/product/info/product_info_card/product_info_card_title.dart';
import 'package:flutter/material.dart';

import '../../../../../../globals/styling.dart';
import '../../../../../../utils/MapNotifier.dart';

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
    List<Map<String, dynamic>> images = widget.block.value['images'];
    List<Widget> imageWidgets = [];
    for (var image in images) {
      List<String> extensions = image['extensions'];
      imageWidgets.add(
        Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
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
              padding: EdgeInsets.only(top: 24),
              height: 200,
              width: 200,
              child: ListView.builder(
                itemCount: extensions.length,
                itemBuilder: (content, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: lightKBoxShadowList,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.only(bottom: 10),
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
