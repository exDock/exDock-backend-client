import 'package:exdock_backend_client/pages/catalog/product/home/widgets/top_bar/product_search.dart';
import 'package:flutter/material.dart';

import 'package:exdock_backend_client/pages/catalog/product/home/widgets/top_bar/dropdown_button_columns.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/top_bar/dropdown_button_filters.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/top_bar/dropdown_button_icon.dart';

class ProductTopBar extends StatefulWidget {
  const ProductTopBar({
    super.key,
    required this.height,
    required this.filterCallback,
    required this.searchCallback,
    required this.setSelectedColumns,
  });

  final double height;
  final Function filterCallback;
  final Function searchCallback;
  final Function setSelectedColumns;

  @override
  State<ProductTopBar> createState() => _ProductTopBarState();
}

class _ProductTopBarState extends State<ProductTopBar> {
  final List<String> actions = ["test", "Test 2"];
  final List<String> columns = ["ID", "THUMBNAIL", "NAME", "PRICE"];
  final List<String> views = ["test"];

  ValueNotifier<List<String>> columnNotifier =
      ValueNotifier(["ID", "THUMBNAIL", "NAME", "PRICE"]);

  void removeColumn(String column) {
    List<String> temp = columnNotifier.value;
    temp.remove(column);
    columnNotifier.value = temp;
  }

  @override
  Widget build(BuildContext context) {
    List<String> filters = ["Test", "Test 2", "Test 3"];
    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 20.0),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: ProductSearch(
                searchCallback: widget.searchCallback,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Flexible(
              child: DropdownButtonIcon(
                list: actions,
                title: "ACTIONS",
                icon: const Icon(Icons.bolt_outlined),
                isIconAtStart: false,
              ),
            ),
            const Expanded(
              child: SizedBox(
                width: 120,
              ),
            ),
            Flexible(
              child: DropdownButtonFilters(
                title: "FILTERS",
                icon: const Icon(Icons.filter_alt_outlined),
                isIconAtStart: false,
                width: 150.0,
                filterCallback: widget.filterCallback,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Flexible(
              child: ValueListenableBuilder(
                  valueListenable: columnNotifier,
                  builder: (context, val, child) {
                    return DropdownButtonColumns(
                      columnList: columns,
                      selectedColumns: val,
                      title: "COLUMNS",
                      icon: const Icon(Icons.view_column_outlined),
                      isIconAtStart: false,
                      deselectColumn: removeColumn,
                      setSelectedColumns: widget.setSelectedColumns,
                    );
                  }),
            ),
            const SizedBox(
              width: 40,
            ),
            Flexible(
              child: DropdownButtonIcon(
                list: filters,
                title: "VIEWS",
                icon: const Icon(Icons.remove_red_eye_outlined),
                isIconAtStart: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
