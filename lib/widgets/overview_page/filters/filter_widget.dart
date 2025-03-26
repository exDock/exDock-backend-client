import 'package:exdock_backend_client/widgets/overview_page/filters/filter_widget_close_button.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/types/filter.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.filter,
    required this.allFilters,
  });

  final Filter filter;
  final FilterNotifier allFilters;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).indicatorColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Text("${filter.name}: ${filter.displayValue}"),
            const SizedBox(width: 12),
            FilterWidgetCloseButton(
              onPressed: () {
                allFilters.removeFilter(filter);
              },
            ),
          ],
        ),
      ),
    );
  }
}
