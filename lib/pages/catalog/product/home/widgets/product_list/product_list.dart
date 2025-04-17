// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/pages/catalog/product/home/product_data.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/product_list/product_info.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/product_list/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.productList,
    required this.pageNum,
    required this.selectedColumns,
  });

  final List<ProductInfo> productList;
  final List<String> selectedColumns;
  final int pageNum;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  SortData listSortData =
      SortData(sortType: null, isAscending: true, isInfoSelected: false);
  ValueNotifier<SortData> infoBarNotifier = ValueNotifier(
      SortData(sortType: null, isAscending: true, isInfoSelected: false));
  ValueNotifier<bool> areAllSelectedNotifier = ValueNotifier(false);

  // Deselects the info widget when a product id gets deselected
  deselectInfoWidget() {
    SortData sortData = SortData(
        sortType: infoBarNotifier.value.sortType,
        isAscending: infoBarNotifier.value.isAscending,
        isInfoSelected: false);
    infoBarNotifier.value = sortData;
  }

  // Changes the state of the info widget id and all other products
  selectInfoWidget() {
    SortData sortData = SortData(
        sortType: infoBarNotifier.value.sortType,
        isAscending: infoBarNotifier.value.isAscending,
        isInfoSelected: !infoBarNotifier.value.isInfoSelected);
    infoBarNotifier.value = sortData;
    areAllSelectedNotifier.value = infoBarNotifier.value.isInfoSelected;
  }

  // Sets the sort type of the product list
  setSortType(String? sortType) {
    bool isAscending = infoBarNotifier.value.sortType == sortType
        ? !infoBarNotifier.value.isAscending
        : true;
    SortData sortData = SortData(
        sortType: sortType,
        isAscending: isAscending,
        isInfoSelected: infoBarNotifier.value.isInfoSelected);

    infoBarNotifier.value = sortData;
    setState(() {
      listSortData = sortData;
    });
  }

  // Sorts the product list based on the sort type
  void sortList(List<ProductInfo> list) {
    switch (infoBarNotifier.value.sortType) {
      case null:
        break;
      case "ID":
        if (infoBarNotifier.value.isAscending) {
          list.sort((a, b) => a.id.compareTo(b.id));
        } else {
          list.sort((a, b) => b.id.compareTo(a.id));
        }
        break;
      case "NAME":
        if (infoBarNotifier.value.isAscending) {
          list.sort((a, b) => a.name.compareTo(b.name));
        } else {
          list.sort((a, b) => b.name.compareTo(a.name));
        }
      case "PRICE":
        if (infoBarNotifier.value.isAscending) {
          list.sort((a, b) => a.price.compareTo(b.price));
        } else {
          list.sort((a, b) => b.price.compareTo(a.price));
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ProductInfo> filteredList = widget.productList;
    List<ProductInfo> finalList = [];

    // Sorts the list based on the sort type
    sortList(filteredList);

    int filteredListLength =
        filteredList.length > 50 + (50 * (widget.pageNum - 1))
            ? 50
            : filteredList.length;

    // Splits the list into pages of 50
    for (int i = 0 + (50 * (widget.pageNum - 1));
        i < filteredListLength + (50 * (widget.pageNum - 1));
        i++) {
      if (i < filteredListLength) finalList.add(filteredList[i]);
    }

    return Expanded(
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: infoBarNotifier,
            builder: (context, val, child) {
              return ProductInfoWidget(
                selectInfoWidget: selectInfoWidget,
                setSortType: setSortType,
                isAllSelected: val.isInfoSelected,
                sortType: val.sortType,
                isAscending: val.isAscending,
                selectedColumns: widget.selectedColumns,
              );
            },
          ),
          if (finalList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount:
                    filteredListLength % 50 == 0 ? 50 : filteredListLength % 50,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder(
                    valueListenable: areAllSelectedNotifier,
                    builder: (context, val, child) {
                      return ProductItem(
                        product: finalList[index],
                        isAllSelected: val,
                        selectedColumns: widget.selectedColumns,
                        deselectInfoWidget: deselectInfoWidget,
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class SortData {
  String? sortType;
  bool isAscending;
  bool isInfoSelected;

  SortData(
      {required this.sortType,
      required this.isAscending,
      required this.isInfoSelected});
}
