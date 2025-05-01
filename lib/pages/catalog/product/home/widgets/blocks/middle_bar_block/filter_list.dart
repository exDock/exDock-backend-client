import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/MapNotifier.dart';

class FilterList extends StatefulWidget {
  const FilterList({
    super.key,
    required this.mapNotifier,
  });

  final MapNotifier mapNotifier;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<Widget> filterWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.mapNotifier,
      builder:
          (BuildContext context, Map<String, dynamic> value, Widget? child) {
        List<dynamic> dynamicFilters = value["filters"];
        List<String> filters = dynamicFilters.map((filter) {
          return filter as String;
        }).toList();
        filterWidgets = [];
        filterWidgets.add(Text("active filters: "));

        // Add a filter widget for each filter in the list
        for (var filter in filters) {
          filterWidgets.add(
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).indicatorColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: kBoxShadowList),
              child: Row(
                children: [
                  Text(filter),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        filters.remove(filter);
                        widget.mapNotifier.updateEntry("filters", filters);
                      });
                    },
                  )
                ],
              ),
            ),
          );
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
      },
    );
  }
}
