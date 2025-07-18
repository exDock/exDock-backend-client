// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backoffice/globals/globals.dart';

class FilterList extends StatefulWidget {
  const FilterList({
    super.key,
    required this.filters,
    required this.height,
    required this.removeFilter,
  });

  final List<String> filters;
  final Function removeFilter;
  final double height;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<Widget> filterWidgets = [];

  @override
  Widget build(BuildContext context) {
    filterWidgets = [];
    filterWidgets.add(const Text("active filters: "));

    // Add a filter widget for each filter in the list
    for (final filter in widget.filters) {
      filterWidgets.add(Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: kBoxShadowList),
        child: Row(
          children: [
            Text(filter),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  widget.filters.remove(filter);
                  widget.removeFilter(widget.filters);
                });
              },
            )
          ],
        ),
      ));
    }

    return Container(
      width: 1150,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
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
