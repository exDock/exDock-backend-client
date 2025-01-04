import 'package:exdock_backend_client/pages/products/widgets/middle_bar/filter_list.dart';
import 'package:exdock_backend_client/pages/products/widgets/middle_bar/product_view_size.dart';
import 'package:exdock_backend_client/pages/products/widgets/middle_bar/remove_filter_button.dart';
import 'package:flutter/material.dart';

class ProductMiddleBar extends StatelessWidget {
  const ProductMiddleBar({
    super.key,
    required this.height,
    required this.filterList,
    required this.removeFilterCallback,
  });

  final double height;
  final List<String> filterList;
  final Function removeFilterCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(left: 16.0, top: 40.0),
      child: Row(
        children: [
          FilterList(
            filters: filterList,
            height: height,
          ),
          RemoveFilterButton(
            removeFilterCallback: removeFilterCallback,
          ),
          ProductViewSize(size: 200),
        ],
      ),
    );
  }
}
