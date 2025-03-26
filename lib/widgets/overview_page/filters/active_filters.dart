import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_widget.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/string_filter.dart';
import 'package:flutter/material.dart';

class ActiveFilters extends StatelessWidget {
  const ActiveFilters({super.key, required this.filters});

  final FilterNotifier filters;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text("active filters:"),
          const SizedBox(width: 12),
          FilterWidget(
            allFilters: filters,
            filter: StringFilter(
              name: "filterName",
              key: "filter_key",
              value: "filter value",
            ),
          ),
        ],
      ),
    );
  }
}
