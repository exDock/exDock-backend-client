import 'package:exdock_backend_client/pages/products/product_data.dart';
import 'package:exdock_backend_client/pages/products/widgets/middle_bar/product_middle_bar.dart';
import 'package:exdock_backend_client/pages/products/widgets/product_list/product_list.dart';
import 'package:exdock_backend_client/pages/products/widgets/top_bar/product_top_bar.dart';
import 'package:flutter/material.dart';

class ProductHomeSynchronous extends StatefulWidget {
  const ProductHomeSynchronous({super.key, required this.productData});

  final ProductData productData;

  @override
  State<ProductHomeSynchronous> createState() => _ProductHomeSynchronousState();
}

class _ProductHomeSynchronousState extends State<ProductHomeSynchronous> {
  List<String> originalFilters = ["Test", "Test 2", "Test 3"];
  List<String> filters = [];
  ValueNotifier<List<String>> filterList = ValueNotifier([]);
  ValueNotifier<List<String>> availableFilters =
      ValueNotifier(["Test", "Test 2", "Test 3"]);

  filterCallback(filter) {
    filterList.value = [...filterList.value, filter];
    availableFilters.value.remove(filter);
  }

  removeFilterCallback() {
    filterList.value = [];
    availableFilters.value = originalFilters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
            valueListenable: availableFilters,
            builder: (context, val, child) {
              return ProductTopBar(
                height: 100,
                filterCallback: filterCallback,
                filters: val,
              );
            }),
        ValueListenableBuilder(
            valueListenable: filterList,
            builder: (context, List<String> val, child) {
              return ProductMiddleBar(
                height: 150,
                filterList: val,
                removeFilterCallback: removeFilterCallback,
              );
            }),
        ProductList(
          productList: widget.productData.products,
        ),
      ],
    );
  }

  @override
  dispose() {
    filterList.dispose();

    super.dispose();
  }
}
