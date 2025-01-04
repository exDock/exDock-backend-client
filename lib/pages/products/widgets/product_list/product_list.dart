import 'package:exdock_backend_client/pages/products/widgets/product_list/product_info.dart';
import 'package:flutter/material.dart';

import '../../product_data.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.productList});

  final List<ProductInfo> productList;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.only(left: 15, right: 50),
      child: Column(
        children: [
          ProductInfoWidget(),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: widget.productList.length,
          //     itemBuilder: (context, index) {
          //       return Expanded(
          //           child: ProductItem(product: widget.productList[index]));
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
