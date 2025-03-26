import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/active_filters.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/overview_page_header.dart';
import 'package:flutter/material.dart';
import 'package:exdock_backend_client/widgets/overview_page/bulk/bulk_action.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({
    super.key,
    required this.columns,
    required this.visibleColumns,
    required this.getRows,
    this.bulkActions = const [],
    this.filters,
    this.individualName,
  });

  final List<OverviewPageColumn> columns;
  final List<OverviewPageColumn> visibleColumns;
  final Future<List<OverviewPageRow>> Function(
    FilterNotifier filters,
    List<OverviewPageColumn>? columns,
    Set<String> allIds,
    IdSetNotifier selectedIds,
  ) getRows;
  final List<BulkAction> bulkActions;
  final FilterNotifier? filters;
  final String? individualName;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late final FilterNotifier allFilters = widget.filters ?? FilterNotifier();

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
          filters: allFilters,
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
                  filters: allFilters,
                )),
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
            getRows: widget.getRows,
            filters: allFilters,
          ),
        ),
      ].reversed.toList(),
    );
  }
}
