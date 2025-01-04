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
      ValueNotifier(ProductListWidgetData(filteredList: [], pageNum: 1));
  ValueNotifier<ProductMiddleBarWidgetData> middleBarNotifier = ValueNotifier(
      ProductMiddleBarWidgetData(filterList: [], pageNum: 1, maxSize: 1));

  List<ProductInfo> applyFilters(List<ProductInfo> list, String searchInput) {
    List<ProductInfo> filteredList = list.where((element) {
      if (!element.name.contains(searchInput)) return false;

      return true;
    }).toList();

    ProductMiddleBarWidgetData temp = ProductMiddleBarWidgetData(
        filterList: middleBarNotifier.value.filterList,
        pageNum: middleBarNotifier.value.pageNum,
        maxSize: (filteredList.length ~/ 50) + 1);

    middleBarNotifier.value = temp;
    return filteredList;
  }

  filterCallback(filter) {
    ProductMiddleBarWidgetData temp = ProductMiddleBarWidgetData(
        filterList: [...middleBarNotifier.value.filterList, filter],
        pageNum: middleBarNotifier.value.pageNum,
        maxSize: middleBarNotifier.value.maxSize);

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
        filteredList: applyFilters(widget.productData.products, searchInput),
        pageNum: listNotifier.value.pageNum);

    listNotifier.value = temp;
  }

  setPageNumCallback(int pageNum) {
    ProductListWidgetData temp = ProductListWidgetData(
        filteredList: listNotifier.value.filteredList, pageNum: pageNum);
    ProductMiddleBarWidgetData tempMiddle = ProductMiddleBarWidgetData(
        filterList: middleBarNotifier.value.filterList,
        pageNum: pageNum,
        maxSize: middleBarNotifier.value.maxSize);

    listNotifier.value = temp;
    middleBarNotifier.value = tempMiddle;
  }

  @override
  void initState() {
    super.initState();

    ProductListWidgetData listTemp = ProductListWidgetData(
        filteredList: applyFilters(widget.productData.products, ""),
        pageNum: listNotifier.value.pageNum);
    int maxSize = (listTemp.filteredList.length ~/ 50) + 1;

    ProductMiddleBarWidgetData middleTemp = ProductMiddleBarWidgetData(
        filterList: middleBarNotifier.value.filterList,
        pageNum: middleBarNotifier.value.pageNum,
        maxSize: maxSize);

    listNotifier.value = listTemp;
    middleBarNotifier.value = middleTemp;
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
              productList: val.filteredList,
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
  List<ProductInfo> filteredList;
  int pageNum;

  ProductListWidgetData({required this.filteredList, required this.pageNum});
}

class ProductMiddleBarWidgetData {
  List<String> filterList;
  int pageNum;
  int maxSize;

  ProductMiddleBarWidgetData(
      {required this.filterList, required this.pageNum, required this.maxSize});
}
