import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.mapNotifier,
  });

  final Map<String, dynamic> product;
  final MapNotifier mapNotifier;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool selectedIcon = false;

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
      child: ValueListenableBuilder(
        valueListenable: widget.mapNotifier,
        builder:
            (BuildContext context, Map<String, dynamic> value, Widget? child) {
          List<String> selectedColumns = value["selected_columns"] ?? [];
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Checkbox column
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                width: 70,
                height: 40,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF264653),
                    ),
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIcon = !selectedIcon;
                        if (selectedIcon) {
                          widget.mapNotifier
                              .updateEntry("is_all_selected", false);
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

              // Build data columns
              ...selectedColumns.map((column) {
                // Safely get the product value with a default
                String value =
                    widget.product["product_$column"]?.toString() ?? "";

                return Container(
                  height: 40,
                  width: 180,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Color(0xFF264653),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Color(0xFF264653),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
