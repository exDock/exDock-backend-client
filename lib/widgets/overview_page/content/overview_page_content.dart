import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content_body.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content_header.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/retrieve_overview_page_pages.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:flutter/material.dart';

class OverviewPageContent extends StatefulWidget {
  const OverviewPageContent({
    super.key,
    required this.visibleColumns,
    required this.getPages,
    required this.filters,
  });

  final List<OverviewPageColumn> visibleColumns;
  final RetrieveOverviewPagePages getPages;
  final FilterNotifier filters;

  @override
  State<OverviewPageContent> createState() => _OverviewPageContentState();
}

class _OverviewPageContentState extends State<OverviewPageContent> {
  Set<String> allIds = {};
  late IdSetNotifier selectedIds = IdSetNotifier(allIds);

  @override
  Widget build(BuildContext context) {
    print("is OverviewPageContent reached?");

    double tableWidth = widget.visibleColumns.fold(
      226, // 50 (selectAll) + 75 (id) + 100 (name) + 1 (left table border)
      (previousValue, element) => previousValue + element.width,
    );

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          OverviewPageContentHeader(
            visibleColumns: widget.visibleColumns,
            tableWidth: tableWidth,
            selectedIds: selectedIds,
          ),
          Expanded(
            child: OverviewPageContentBody(
              // TODO: reconsider if columnsToRetrieve should be the same as visibleColumns
              columnsToRetrieve: widget.visibleColumns,
              getPages: widget.getPages,
              filters: widget.filters,
              tableWidth: tableWidth,
              allIds: allIds,
              selectedIds: selectedIds,
            ),
          ),
        ],
      ),
    );
  }
}
