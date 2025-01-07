import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key, required this.filters, required this.height});

  final List<String> filters;
  final double height;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<Widget> filterWidgets = [];

  @override
  Widget build(BuildContext context) {
    filterWidgets = [];
    filterWidgets.add(Text("active filters: "));

    for (var filter in widget.filters) {
      filterWidgets.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: kBoxShadowList),
        child: Text(filter),
      ));
    }

    return Container(
      width: 1150,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 2.0, color: Colors.grey),
        bottom: BorderSide(width: 2.0, color: Colors.grey),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: filterWidgets,
      ),
    );
  }
}
