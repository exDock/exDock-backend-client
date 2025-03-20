import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row_cell.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row_cell_string.dart';
import 'package:flutter/material.dart';

class OverviewPageRow extends StatefulWidget {
  const OverviewPageRow({
    super.key,
    required this.id,
    required this.name,
    required this.visibleColumns,
    required this.columnValues,
    required this.allIds,
    required this.selectedIds,
  });

  final String id;
  final String name;

  /// All the columns that are visible in the table
  final List<OverviewPageColumn> visibleColumns;

  /// All column values | {key: value}
  final Map<String, dynamic> columnValues;

  final Set<String> allIds;
  final IdSetNotifier selectedIds;

  @override
  State<OverviewPageRow> createState() => _OverviewPageRowState();
}

class _OverviewPageRowState extends State<OverviewPageRow> {
  @override
  void initState() {
    widget.allIds.add(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double contentWidth =
        225; // Initial width: 50 (selectAll) + 75 (id) + 100 (name)
    for (var column in widget.visibleColumns) {
      contentWidth += column.width;
    }

    return Container(
      width: contentWidth,
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
              cellValue: Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              width: 50,
            ),
            OverviewPageRowCellString(
              cellValue: widget.id,
              width: 75,
            ),
            OverviewPageRowCellString(
              cellValue: widget.name,
              width: 100,
            ),
            ...widget.visibleColumns.asMap().entries.map((entry) {
              int index = entry.key;
              OverviewPageColumn column = entry.value;
              return OverviewPageRowCellString(
                cellValue: widget.columnValues[column.columnKey],
                width: column.width,
                isLast: index == widget.visibleColumns.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }
}
