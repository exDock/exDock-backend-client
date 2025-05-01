import 'package:flutter/material.dart';

import '../../../../../../../utils/MapNotifier.dart';

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({
    super.key,
    required this.mapNotifier,
  });

  final MapNotifier mapNotifier;

  @override
  State<ProductInfoWidget> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 100),
      decoration: const BoxDecoration(
        color: Color(0xFF264653),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(7.5),
          bottomRight: Radius.circular(7.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Checkbox column header
          ValueListenableBuilder(
            valueListenable: widget.mapNotifier,
            builder: (BuildContext context, Map<String, dynamic> value,
                Widget? child) {
              bool isAllSelected = value["is_all_selected"] ?? false;

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 40,
                // width: 70,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.white),
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      widget.mapNotifier
                          .updateEntry("is_all_selected", !isAllSelected);
                    },
                    child: Icon(
                      isAllSelected
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),

          ValueListenableBuilder(
            valueListenable: widget.mapNotifier,
            builder: (BuildContext context, Map<String, dynamic> value,
                Widget? child) {
              List<String> selectedColumns =
                  value["selected_columns"] ?? ["ID"];
              String sortType = value["sort_type"] ?? "ID";
              bool isAscending = value["is_ascending"] ?? true;

              return Row(
                children: [
                  ...selectedColumns.map(
                    (columnName) {
                      return GestureDetector(
                        onTap: () {
                          // Toggle sort direction if the same column is clicked again
                          if (sortType == columnName) {
                            widget.mapNotifier
                                .updateEntry("is_ascending", !isAscending);
                          } else {
                            widget.mapNotifier
                                .updateEntry("sort_type", columnName);
                            widget.mapNotifier
                                .updateEntry("is_ascending", true);
                          }
                        },
                        child: Container(
                          height: 40,
                          // width: 180,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.white),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                columnName.toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              if (sortType == columnName)
                                Icon(
                                  isAscending
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
