import 'package:exdock_backend_client/pages/products/widgets/product_list/product_info.dart';
import 'package:exdock_backend_client/pages/products/widgets/product_list/product_item.dart';
import 'package:flutter/material.dart';

import '../../product_data.dart';

class ProductList extends StatefulWidget {
  const ProductList(
      {super.key, required this.productList, required this.pageNum});

  final List<ProductInfo> productList;
  final int pageNum;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    List<ProductInfo> filteredList = widget.productList;
    List<ProductInfo> finalList = [];
    int filteredListLength =
        filteredList.length > 50 + (50 * (widget.pageNum - 1))
            ? 50
            : filteredList.length;

    for (int i = 0 + (50 * (widget.pageNum - 1));
        i < filteredListLength + (50 * (widget.pageNum - 1));
        i++) {
      if (i < filteredListLength) finalList.add(filteredList[i]);
    }

    return Expanded(
      child: Column(
        children: [
          ProductInfoWidget(),
          if (finalList.isNotEmpty)
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount:
                    filteredListLength % 50 == 0 ? 50 : filteredListLength % 50,
                itemBuilder: (context, index) {
                  return ProductItem(product: finalList[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
