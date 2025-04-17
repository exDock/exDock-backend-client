// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/pages/catalog/product/home/product_data.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.isAllSelected,
    required this.deselectInfoWidget,
    required this.selectedColumns,
  });

  final ProductInfo product;
  final bool isAllSelected;
  final Function deselectInfoWidget;
  final List<String> selectedColumns;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool selectedIcon = false;

  @override
  void didUpdateWidget(covariant ProductItem oldWidget) {
    selectedIcon = widget.isAllSelected;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF264653),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(7.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: 70,
              height: 40,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Color(0xFF264653),
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = !selectedIcon;
                    if (widget.isAllSelected) {
                      widget.deselectInfoWidget();
                    }
                  });
                },
                child: Icon(
                  selectedIcon
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  color: const Color(0xFF264653),
                ),
              ),
            ),
          ),
          if (widget.selectedColumns.contains("ID"))
            Flexible(
              flex: 1,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF264653),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.product.id.toString(),
                      style: const TextStyle(
                        color: Color(0xFF264653),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (widget.selectedColumns.contains("THUMBNAIL"))
            Flexible(
              flex: 3,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF264653),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.product.thumbnail,
                      style: const TextStyle(
                        color: Color(0xFF264653),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (widget.selectedColumns.contains("NAME"))
            Flexible(
              flex: 8,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF264653),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        color: Color(0xFF264653),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (widget.selectedColumns.contains("PRICE"))
            Flexible(
              flex: 3,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF264653),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.product.price.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Color(0xFF264653),
                      ),
                    )
                  ],
                ),
              ),
            ),
          Expanded(
            flex: 15,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
