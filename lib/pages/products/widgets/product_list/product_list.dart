import 'package:exdock_backend_client/pages/products/widgets/product_list/product_info.dart';
import 'package:exdock_backend_client/pages/products/widgets/product_list/product_item.dart';
import 'package:flutter/material.dart';

import '../../product_data.dart';

class ProductList extends StatefulWidget {
  const ProductList(
      {super.key, required this.productList, required this.nameFilter});

  final List<ProductInfo> productList;
  final String nameFilter;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    List<ProductInfo> filteredList = widget.productList
        .where((element) => element.name
            .toLowerCase()
            .contains(widget.nameFilter.toLowerCase()))
        .toList();

    return Container(
      margin: EdgeInsets.only(left: 15, right: 50),
      child: Column(
        children: [
          ProductInfoWidget(),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ProductItem(product: filteredList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
