import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row_cell.dart';
import 'package:flutter/material.dart';

class OverviewPageRow extends StatelessWidget {
  const OverviewPageRow({
    super.key,
    required this.id,
    required this.name,
    required this.visibleColumns,
    required this.columnValues,
  });

  final String id;
  final String name;

  /// All the columns that are visible in the table
  final List<OverviewPageColumn> visibleColumns;

  /// All column values | {key: value}
  final Map<String, dynamic> columnValues;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 150),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: darkColour.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            OverviewPageRowCell(
              cellValue: id,
              width: 75,
            ),
            OverviewPageRowCell(
              cellValue: name,
              width: 100,
            ),
            ...visibleColumns.asMap().entries.map((entry) {
              final index = entry.key;
              final column = entry.value;
              return OverviewPageRowCell(
                cellValue: columnValues[column.columnKey],
                width: column.width,
                isLast: index == visibleColumns.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }
}
