import 'package:exdock_backend_client/pages/page_wrapper/top_bar/search.dart';
import 'package:exdock_backend_client/pages/products/widgets/top_bar/dropdown_button_filters.dart';
import 'package:exdock_backend_client/pages/products/widgets/top_bar/dropdown_button_icon.dart';
import 'package:flutter/material.dart';

class ProductTopBar extends StatelessWidget {
  ProductTopBar(
      {super.key,
      required this.height,
      required this.filterCallback,
      required this.filters});

  final double height;
  final List<String> filters;

  final List<String> actions = ["test", "Test 2"];
  final List<String> columns = ["Test"];
  final List<String> views = ["test"];
  final Function filterCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, top: 20.0),
        child: Row(
          children: [
            Search(
              width: 700,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
            DropdownButtonIcon(
              list: actions,
              title: "ACTIONS",
              icon: Icon(Icons.bolt_outlined),
              isIconAtStart: false,
              width: 150.0,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 60.0)),
            DropdownButtonFilters(
              list: filters,
              title: "FILTERS",
              icon: Icon(Icons.filter_alt_outlined),
              isIconAtStart: false,
              width: 150.0,
              filterCallback: filterCallback,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
            DropdownButtonIcon(
              list: filters,
              title: "COLUMNS",
              icon: Icon(Icons.view_column_outlined),
              isIconAtStart: false,
              width: 150.0,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
            DropdownButtonIcon(
              list: filters,
              title: "VIEWS",
              icon: Icon(Icons.remove_red_eye_outlined),
              isIconAtStart: false,
              width: 150.0,
            ),
          ],
        ),
      ),
    );
  }
}
