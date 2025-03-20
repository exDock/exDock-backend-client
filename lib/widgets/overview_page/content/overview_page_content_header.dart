import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column_cell.dart';
import 'package:flutter/material.dart';

class OverviewPageContentHeader extends StatelessWidget {
  const OverviewPageContentHeader({
    super.key,
    required this.visibleColumns,
    required this.tableWidth,
  });

  final List<OverviewPageColumn> visibleColumns;
  final double tableWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColour,
      width: tableWidth,
      child: Row(
        children: [
          // TODO: select all
          const SizedBox(width: 1), // compensate for left border
          const OverviewPageColumnCell(columnName: "ID", width: 75),
          const OverviewPageColumnCell(columnName: "name", width: 100),
          for (OverviewPageColumn column in visibleColumns)
            OverviewPageColumnCell(
              columnName: column.name,
              columnKey: column.columnKey,
              width: column.width,
            ),
        ],
      ),
    );
  }
}
