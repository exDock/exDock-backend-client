import 'package:exdock_backend_client/pages/products/widgets/top_bar/dropdown_button_filters.dart';
import 'package:exdock_backend_client/pages/products/widgets/top_bar/dropdown_button_icon.dart';
import 'package:exdock_backend_client/pages/products/widgets/top_bar/product_search.dart';
import 'package:flutter/material.dart';

class ProductTopBar extends StatelessWidget {
  ProductTopBar(
      {super.key,
      required this.height,
      required this.filterCallback,
      required this.searchCallback});

  final double height;
  final List<String> actions = ["test", "Test 2"];
  final List<String> columns = ["Test"];
  final List<String> views = ["test"];
  final Function filterCallback;
  final Function searchCallback;

  @override
  Widget build(BuildContext context) {
    List<String> filters = ["Test", "Test 2", "Test 3"];
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, top: 20.0),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: ProductSearch(
                searchCallback: searchCallback,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Flexible(
              child: DropdownButtonIcon(
                list: actions,
                title: "ACTIONS",
                icon: Icon(Icons.bolt_outlined),
                isIconAtStart: false,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 120,
              ),
            ),
            Flexible(
              child: DropdownButtonFilters(
                title: "FILTERS",
                icon: Icon(Icons.filter_alt_outlined),
                isIconAtStart: false,
                width: 150.0,
                filterCallback: filterCallback,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Flexible(
              child: DropdownButtonIcon(
                list: filters,
                title: "COLUMNS",
                icon: Icon(Icons.view_column_outlined),
                isIconAtStart: false,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Flexible(
              child: DropdownButtonIcon(
                list: filters,
                title: "VIEWS",
                icon: Icon(Icons.remove_red_eye_outlined),
                isIconAtStart: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
