import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content_body.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content_header.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:flutter/material.dart';

class OverviewPageContent extends StatelessWidget {
  const OverviewPageContent({
    super.key,
    required this.visibleColumns,
    required this.getRows,
    required this.filters,
  });

  final List<OverviewPageColumn> visibleColumns;
  final Future<List<OverviewPageRow>> Function(
    List<Filter> filters,
    List<OverviewPageColumn>? columns,
  ) getRows;
  final List<Filter> filters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OverviewPageContentHeader(visibleColumns: visibleColumns),
        OverviewPageContentBody(
          // TODO: reconsider if columnsToRetrieve should be the same as visibleColumns
          columnsToRetrieve: visibleColumns,
          getRows: getRows,
          filters: filters,
        ),
      ],
    );
  }
}
