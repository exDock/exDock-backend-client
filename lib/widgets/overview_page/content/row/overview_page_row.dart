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
      height: 100, // TODO: find a way to make this dynamic
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: darkColour.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: visibleColumns.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return OverviewPageRowCell(
              cellValue: id,
              width: 50,
            );
          }
          if (index == 1) {
            return OverviewPageRowCell(
              cellValue: name,
              width: 100,
            );
          }
          return OverviewPageRowCell(
            cellValue: columnValues[visibleColumns[index - 2].columnKey],
            width: visibleColumns[index - 2].width,
          );
        },
      ),
    );
  }
}
