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
  ValueNotifier<List<String>> availableFilters =
      ValueNotifier(["Test", "Test 2", "Test 3"]);
  ValueNotifier<ProductListWidgetData> listNotifier =
      ValueNotifier(ProductListWidgetData(nameFilter: "", pageNum: 1));
  ValueNotifier<ProductMiddleBarWidgetData> middleBarNotifier = ValueNotifier(
      ProductMiddleBarWidgetData(filterList: [], pageNum: 1, maxSize: 1));

  filterCallback(filter) {
    ProductMiddleBarWidgetData temp = ProductMiddleBarWidgetData(
        filterList: [...middleBarNotifier.value.filterList, filter],
        pageNum: middleBarNotifier.value.pageNum,
        maxSize: 1);

    availableFilters.value.remove(filter);
    middleBarNotifier.value = temp;
  }

  removeFilterCallback() {
    ProductMiddleBarWidgetData temp = ProductMiddleBarWidgetData(
        filterList: [], pageNum: middleBarNotifier.value.pageNum, maxSize: 1);

    availableFilters.value = originalFilters;
    middleBarNotifier.value = temp;
  }

  searchCallback(String searchInput) {
    ProductListWidgetData temp = ProductListWidgetData(
        nameFilter: searchInput, pageNum: listNotifier.value.pageNum);

    listNotifier.value = temp;
  }

  setPageNumCallback(int pageNum) {
    ProductListWidgetData temp = ProductListWidgetData(
        nameFilter: listNotifier.value.nameFilter, pageNum: pageNum);
    ProductMiddleBarWidgetData tempMiddle = ProductMiddleBarWidgetData(
        filterList: middleBarNotifier.value.filterList,
        pageNum: pageNum,
        maxSize: 1);

    listNotifier.value = temp;
    middleBarNotifier.value = tempMiddle;
    print(listNotifier.value.pageNum);
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
              filters: val,
              filterCallback: filterCallback,
              searchCallback: searchCallback,
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: middleBarNotifier,
          builder: (context, val, child) {
            return ProductMiddleBar(
              height: 150,
              filterList: val.filterList,
              pageNum: val.pageNum,
              maxSize: val.maxSize,
              removeFilterCallback: removeFilterCallback,
              setPageNumCallback: setPageNumCallback,
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: listNotifier,
          builder: (context, val, child) {
            return ProductList(
              productList: widget.productData.products,
              nameFilter: val.nameFilter,
              pageNum: val.pageNum,
            );
          },
        ),
      ],
    );
  }

  @override
  dispose() {
    availableFilters.dispose();
    middleBarNotifier.dispose();
    listNotifier.dispose();

    super.dispose();
  }
}

class ProductListWidgetData {
  String nameFilter;
  int pageNum;

  ProductListWidgetData({required this.nameFilter, required this.pageNum});
}

class ProductMiddleBarWidgetData {
  List<String> filterList;
  int pageNum;
  int maxSize;

  ProductMiddleBarWidgetData(
      {required this.filterList, required this.pageNum, required this.maxSize});
}
