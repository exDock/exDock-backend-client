import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column_cell.dart';
import 'package:flutter/material.dart';

class OverviewPageContentHeader extends StatelessWidget {
  const OverviewPageContentHeader({super.key, required this.visibleColumns});

  final List<OverviewPageColumn> visibleColumns;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: select all
        const OverviewPageColumnCell(columnName: "ID", width: 50),
        const OverviewPageColumnCell(columnName: "name", width: 100),
        for (OverviewPageColumn column in visibleColumns)
          OverviewPageColumnCell(
            columnName: column.name,
            columnKey: column.columnKey,
            width: column.width,
          ),
      ],
    );
  }
}
