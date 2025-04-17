// Flutter imports:
import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/retrieve_overview_page_pages.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/active_filters.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/overview_page_header.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({
    super.key,
    required this.columns,
    required this.visibleColumns,
    required this.getPages,
    this.bulkActions = const [],
    required this.filters,
    this.individualName,
    required this.allIds,
    required this.selectedIds,
  });

  final List<OverviewPageColumn> columns;
  final List<OverviewPageColumn> visibleColumns;
  final RetrieveOverviewPagePages getPages;
  final List<BulkAction> bulkActions;
  final FilterNotifier filters;
  final String? individualName;
  final Set<String> allIds;
  final IdSetNotifier selectedIds;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  void initState() {
    super.initState();

    for (OverviewPageColumn column in widget.columns) {
      if (!widget.visibleColumns.contains(column)) {
        widget.visibleColumns.add(column);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverviewPageHeader(
          columns: widget.columns,
          visibleColumns: widget.visibleColumns,
          bulkActions: widget.bulkActions,
          filters: widget.filters,
          individualName: widget.individualName,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 124, left: 24, right: 24),
          child: SizedBox(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ActiveFilters(
                    filters: widget.filters,
                  ),
                ),
                const SizedBox(width: 24),
                // TODO: current page
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 199),
          child: OverviewPageContent(
            visibleColumns: widget.visibleColumns,
            getPages: widget.getPages,
            filters: widget.filters,
            allIds: widget.allIds,
            selectedIds: widget.selectedIds,
          ),
        ),
      ].reversed.toList(),
    );
  }
}
