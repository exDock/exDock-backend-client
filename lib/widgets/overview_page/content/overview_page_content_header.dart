import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column_cell.dart';
import 'package:flutter/material.dart';

class OverviewPageContentHeader extends StatelessWidget {
  const OverviewPageContentHeader({
    super.key,
    required this.visibleColumns,
    required this.tableWidth,
    required this.selectedIds,
  });

  final List<OverviewPageColumn> visibleColumns;
  final double tableWidth;
  final IdSetNotifier selectedIds;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColour,
      width: tableWidth,
      child: Row(
        children: [
          const SizedBox(width: 1), // compensate for left border
          SizedBox(
            width: 50,
            child: Checkbox(
              value: false,
              side: BorderSide(
                color: Theme.of(context).indicatorColor,
                width: 1.5,
              ),
              onChanged: (value) {},
            ),
          ),
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
