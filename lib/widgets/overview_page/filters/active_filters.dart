import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_widget.dart';
import 'package:flutter/material.dart';

class ActiveFilters extends StatefulWidget {
  const ActiveFilters({super.key, required this.filters});

  final FilterNotifier filters;

  @override
  State<ActiveFilters> createState() => _ActiveFiltersState();
}

class _ActiveFiltersState extends State<ActiveFilters> {
  final ScrollController _scrollController = ScrollController();

  List<Filter> getSortedFilters() {
    return widget.filters.value.values.toList();
  }

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
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text("active filters:"),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: widget.filters,
              builder: (context, value, child) {
                List<Filter> sortedFilters = getSortedFilters();

                return ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: sortedFilters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: FilterWidget(
                        allFilters: widget.filters,
                        filter: sortedFilters[index],
                      ),
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
