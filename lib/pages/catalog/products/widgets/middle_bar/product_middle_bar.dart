import 'package:exdock_backend_client/pages/catalog/products/widgets/middle_bar/product_view_size.dart';
import 'package:exdock_backend_client/pages/catalog/products/widgets/middle_bar/remove_filter_button.dart';
import 'package:flutter/material.dart';

import 'filter_list.dart';

class ProductMiddleBar extends StatelessWidget {
  const ProductMiddleBar({
    super.key,
    required this.height,
    required this.filterList,
    required this.removeFilterCallback,
    required this.setPageNumCallback,
    required this.pageNum,
    required this.maxSize,
  });

  final double height;
  final List<String> filterList;
  final int pageNum;
  final int maxSize;
  final Function removeFilterCallback;
  final Function setPageNumCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(left: 16.0, top: 40.0),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: FilterList(
              filters: filterList,
              height: height,
            ),
          ),
          Flexible(
            child: RemoveFilterButton(
              removeFilterCallback: removeFilterCallback,
            ),
          ),
          Flexible(
            child: ProductViewSize(
              size: pageNum,
              pageNumCallback: setPageNumCallback,
              maxSize: maxSize,
            ),
          ),
        ],
      ),
    );
  }
}
