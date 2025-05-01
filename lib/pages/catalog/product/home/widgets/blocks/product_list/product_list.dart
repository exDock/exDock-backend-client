import 'package:exdock_backend_client/pages/catalog/product/home/product_home_synchronous.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/blocks/product_info_item/ProductInfoItemName.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/blocks/product_info_item/product_info_checkbox_entry.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/blocks/product_info_item/product_info_field_entry.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/blocks/product_info_item/product_item_info_checkbox.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/MapNotifier.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.block,
    required this.mapNotifier,
  });

  final MapEntry<String, dynamic> block;
  final MapNotifier mapNotifier;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  SortData listSortData =
      SortData(sortType: null, isAscending: true, isInfoSelected: false);
  List<Map<String, dynamic>> filteredList = [];
  List<Map<String, dynamic>> _productList = [];

  @override
  void initState() {
    super.initState();
    handleNotifierChange();
  }

  void handleNotifierChange() {
    widget.mapNotifier.addListener(() {
      if (widget.mapNotifier.attributeChanged(["filter_value"])) {
        List<String> filterList = [];
        Filters filters = widget.mapNotifier.value["filter_value"];

        if (filters.id != null) {
          filterList.add("ID: ${filters.id}");
          filteredList = filteredList.where((element) {
            if (element["product_id"] != filters.id) return false;
            return true;
          }).toList();
        }

        if (filters.lowPrice != null) {
          filterList.add("Low Price: ${filters.lowPrice}");
          filteredList = filteredList.where((element) {
            if (element["price"] < filters.lowPrice!) return false;
            return true;
          }).toList();
        }

        if (filters.highPrice != null) {
          filterList.add("High Price: ${filters.highPrice}");
          filteredList = filteredList.where((element) {
            if (element["price"] > filters.highPrice!) return false;
            return true;
          }).toList();
        }

        if (filters.searchInput != "") {
          filterList.add("Search: ${filters.searchInput}");
          filteredList = filteredList.where((element) {
            if (!element["product_name"].contains(filters.searchInput!))
              return false;
            return true;
          }).toList();
        }

        widget.mapNotifier.updateEntry("filters", filterList);
      }
    });
  }

  void _sortList(Map<String, dynamic> value) {
    List<Map<String, dynamic>> newList = List.from(_productList);
    switch (value["sort_type"]) {
      case null:
        break;
      case "ID":
        if (value["is_ascending"]) {
          newList.sort((a, b) => a["product_id"].compareTo(b["product_id"]));
        } else {
          newList.sort((a, b) => b["product_id"].compareTo(a["product_id"]));
        }
        break;
      case "NAME":
        if (value["is_ascending"]) {
          newList
              .sort((a, b) => a["product_name"].compareTo(b["product_name"]));
        } else {
          newList
              .sort((a, b) => b["product_name"].compareTo(a["product_name"]));
        }
        break;
      case "PRICE":
        if (value["is_ascending"]) {
          newList.sort((a, b) => a["price"].compareTo(b["price"]));
        } else {
          newList.sort((a, b) => b["price"].compareTo(a["price"]));
        }
        break;
    }
    _productList = newList;
  }

  List<Map<String, dynamic>> _mapProductList(List<dynamic> productList) {
    return productList.map((p) {
      return p as Map<String, dynamic>;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> columnNames =
        widget.block.value["attributes"][1]["current_attribute_value"];
    columnNames = columnNames.map((e) => e as String).toList();

    return ValueListenableBuilder(
      valueListenable: widget.mapNotifier,
      builder:
          (BuildContext context, Map<String, dynamic> value, Widget? child) {
        filteredList = _mapProductList(
            widget.block.value["attributes"][0]["current_attribute_value"]);
        int pageNum = value["page_num"];
        int startIndex = (pageNum - 1) * 50;
        int endIndex = startIndex + 50;

        _sortList(value);

        if (endIndex > filteredList.length) {
          endIndex = filteredList.length;
        }

        List<Map<String, dynamic>> finalList =
            filteredList.sublist(startIndex, endIndex);

        List<Map<String, dynamic>> temp = [];

        for (var index = 0; index < 50; index++) {
          temp.add(finalList[0]);
        }

        finalList = temp;

        List<Widget> checkBoxes = List.empty(growable: true);
        for (var index = 0; index < finalList.length; index++) {
          checkBoxes.add(
            ProductInfoCheckboxEntry(
              isBottomCheckbox: index == finalList.length - 1,
            ),
          );
        }

        int itemCount = finalList.length;
        int infoCount = value["selected_columns"].length;

        final double totalHeight = itemCount * 48.0 + 40.0;

        return Container(
          height: totalHeight,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: ScrollController(),
            itemCount: columnNames.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return IntrinsicWidth(
                  child: Column(
                    children: [
                      ProductItemInfoCheckbox(),
                      Column(
                        children: checkBoxes,
                      ),
                    ],
                  ),
                );
              } else {
                List<Widget> productInfo = [];
                String columnName = columnNames[index - 1];

                for (var productIndex = 0;
                    productIndex < finalList.length;
                    productIndex++) {
                  productInfo.add(
                    ProductInfoFieldEntry(
                      product: finalList[productIndex],
                      columnName: columnName,
                      isLastItem: index == columnNames.length,
                      isBottomProduct: productIndex == finalList.length - 1,
                    ),
                  );
                }

                return SizedBox(
                  child: IntrinsicWidth(
                    child: Column(
                      children: [
                        ProductInfoItemName(
                          itemName: columnName,
                          mapNotifier: widget.mapNotifier,
                          isLastItem: index == columnNames.length,
                        ),
                        Column(
                          children: productInfo,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          // child: IntrinsicWidth(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         controller: _scrollController,
          //         child: ProductInfoWidget(
          //           mapNotifier: widget.mapNotifier,
          //         ),
          //       ),
          //       if (finalList.isNotEmpty)
          //         Expanded(
          //           child: SingleChildScrollView(
          //             controller: _scrollController,
          //             scrollDirection: Axis.horizontal,
          //             child: ConstrainedBox(
          //               constraints: BoxConstraints(
          //                 maxWidth: 4000,
          //               ),
          //               child: ListView.builder(
          //                 scrollDirection: Axis.vertical,
          //                 itemCount: itemCount % 50 == 0 ? 50 : itemCount % 50,
          //                 itemBuilder: (context, index) {
          //                   return SizedBox(
          //                     height: 60,
          //                     child: ProductItem(
          //                       product: finalList[index],
          //                       mapNotifier: widget.mapNotifier,
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ),
          //         ),
          //     ],
          //   ),
          // ),
        );
      },
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
