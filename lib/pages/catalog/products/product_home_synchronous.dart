import 'package:exdock_backend_client/pages/catalog/products/product_data.dart';
import 'package:exdock_backend_client/pages/catalog/products/widgets/middle_bar/product_middle_bar.dart';
import 'package:exdock_backend_client/pages/catalog/products/widgets/product_list/product_list.dart';
import 'package:exdock_backend_client/pages/catalog/products/widgets/top_bar/product_top_bar.dart';
import 'package:flutter/material.dart';

class ProductHomeSynchronous extends StatefulWidget {
  const ProductHomeSynchronous({super.key, required this.productData});

  final ProductData productData;

  @override
  State<ProductHomeSynchronous> createState() => _ProductHomeSynchronousState();
}

class _ProductHomeSynchronousState extends State<ProductHomeSynchronous> {
  Filters selectedFilters = Filters(searchInput: "");
  List<String> originalFilters = ["Test", "Test 2", "Test 3"];
  ValueNotifier<ProductListWidgetData> listNotifier =
      ValueNotifier(ProductListWidgetData(filteredList: [], pageNum: 1));
  ValueNotifier<ProductMiddleBarWidgetData> middleBarNotifier = ValueNotifier(
      ProductMiddleBarWidgetData(filterList: [], pageNum: 1, maxSize: 1));

  // Applies filters to the list based on the search input, id, low price, and high price
  List<ProductInfo> applyFilters(
    List<ProductInfo> list,
    Filters filters,
  ) {
    List<ProductInfo> filteredList = list.where((element) {
      if (!element.name.contains(filters.searchInput)) return false;
      return true;
    }).toList();

    if (filters.id != null) {
      filteredList = filteredList.where((element) {
        if (element.id != filters.id) return false;
        return true;
      }).toList();
    }

    if (filters.lowPrice != null) {
      filteredList = filteredList.where((element) {
        if (element.price < filters.lowPrice!) return false;
        return true;
      }).toList();
    }

    if (filters.highPrice != null) {
      filteredList = filteredList.where((element) {
        if (element.price > filters.highPrice!) return false;
        return true;
      }).toList();
    }

    ProductMiddleBarWidgetData temp = ProductMiddleBarWidgetData(
        filterList: middleBarNotifier.value.filterList,
        pageNum: middleBarNotifier.value.pageNum,
        maxSize: (filteredList.length ~/ 50) + 1);

    middleBarNotifier.value = temp;
    return filteredList;
  }

  // Callback function for the apply filter button
  filterCallback(Filters filter) {
    List<String> filterList = middleBarNotifier.value.filterList;

    filterList = filterList.where((element) {
      if (element.contains("ID:")) return false;
      return true;
    }).toList();
    if (filter.id != null) {
      filterList.add("ID: ${filter.id}");
    }

    filterList = filterList.where((element) {
      if (element.contains("Price:")) return false;
      return true;
    }).toList();

    if (filter.lowPrice != null || filter.highPrice != null) {
      if (filter.lowPrice != null && filter.highPrice != null) {
        filterList.add("Price: ${filter.lowPrice} - ${filter.highPrice}");
      } else if (filter.lowPrice != null) {
        filterList.add("Price: > ${filter.lowPrice}");
      } else {
        filterList.add("Price: < ${filter.highPrice}");
      }
    }

    ProductMiddleBarWidgetData temp = ProductMiddleBarWidgetData(
      filterList: filterList,
      pageNum: middleBarNotifier.value.pageNum,
      maxSize: middleBarNotifier.value.maxSize,
    );

    middleBarNotifier.value = temp;

    ProductListWidgetData productListWidgetData = ProductListWidgetData(
        filteredList: applyFilters(widget.productData.products, filter),
        pageNum: listNotifier.value.pageNum);

    listNotifier.value = productListWidgetData;
  }

  // Callback function to remove all active filters
  removeFilterCallback() {
    selectedFilters = Filters(searchInput: "");
    ProductMiddleBarWidgetData temp = ProductMiddleBarWidgetData(
        filterList: [], pageNum: middleBarNotifier.value.pageNum, maxSize: 1);

    middleBarNotifier.value = temp;

    ProductListWidgetData productListWidgetData = ProductListWidgetData(
        filteredList:
            applyFilters(widget.productData.products, selectedFilters),
        pageNum: listNotifier.value.pageNum);

    listNotifier.value = productListWidgetData;
  }

  // Remove a single filter from the list
  removeFilterFromList(List<String> filters) {
    if (selectedFilters.searchInput != "" &&
        !filters.contains("Name: ${selectedFilters.searchInput}")) {
      selectedFilters.searchInput = "";
    }
    if (selectedFilters.id != null &&
        !filters.contains("ID: ${selectedFilters.id}")) {
      selectedFilters.id = null;
    }
    if (selectedFilters.lowPrice != null &&
        selectedFilters.highPrice != null &&
        !filters.contains(
            "Price: ${selectedFilters.lowPrice} - ${selectedFilters.highPrice}")) {
      selectedFilters.lowPrice = null;
      selectedFilters.highPrice = null;
    } else if (selectedFilters.lowPrice != null &&
        !filters.contains("Price: > ${selectedFilters.lowPrice}")) {
      selectedFilters.lowPrice = null;
    } else if (selectedFilters.highPrice != null &&
        !filters.contains("Price: < ${selectedFilters.highPrice}")) {
      selectedFilters.highPrice = null;
    }

    ProductListWidgetData temp = ProductListWidgetData(
        filteredList:
            applyFilters(widget.productData.products, selectedFilters),
        pageNum: listNotifier.value.pageNum);

    listNotifier.value = temp;
  }

  // Apply search input filter
  searchCallback(String searchInput) {
    List<String> filterList = middleBarNotifier.value.filterList;
    selectedFilters.searchInput = searchInput;
    ProductListWidgetData temp = ProductListWidgetData(
        filteredList:
            applyFilters(widget.productData.products, selectedFilters),
        pageNum: listNotifier.value.pageNum);

    filterList = filterList.where((element) {
      if (element.contains("Name: ")) return false;
      return true;
    }).toList();

    if (searchInput != "") {
      filterList.add("Name: $searchInput");
    }

    ProductMiddleBarWidgetData tempMiddle = ProductMiddleBarWidgetData(
      filterList: filterList,
      pageNum: middleBarNotifier.value.pageNum,
      maxSize: middleBarNotifier.value.maxSize,
    );

    middleBarNotifier.value = tempMiddle;
    listNotifier.value = temp;
  }

  // Sets the page number for the list
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
        filteredList:
            applyFilters(widget.productData.products, selectedFilters),
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
        ProductTopBar(
          height: 100,
          filterCallback: filterCallback,
          searchCallback: searchCallback,
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
              removeFilter: removeFilterFromList,
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

class Filters {
  String searchInput;
  int? id;
  double? lowPrice;
  double? highPrice;

  Filters({required this.searchInput, this.id, this.lowPrice, this.highPrice});
}
