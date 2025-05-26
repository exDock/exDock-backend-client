// Flutter imports:
import 'package:exdock_backend_client/widgets/overview_page/visible_columns_selection/visible_column_selection.dart';
import 'package:exdock_backend_client/widgets/overview_page/visible_columns_selection/visible_columns_notifier.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';

class VisibleColumnsSelection extends StatelessWidget {
  const VisibleColumnsSelection({
    super.key,
    required this.columns,
    required this.visibleColumns,
  });

  final List<OverviewPageColumnData> columns;
  final VisibleColumnsNotifier visibleColumns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Container(
        width: 1048,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.extent(
            maxCrossAxisExtent: 256,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 16 / 6,
            children: List<Widget>.generate(columns.length, (index) {
              return VisibleColumnSelection(
                column: columns[index],
                visibleColumns: visibleColumns,
                onToggle: (OverviewPageColumnData column, bool isVisible) {
                  if (isVisible) {
                    visibleColumns.silentAddColumn(column);
                  } else {
                    visibleColumns.silentRemoveColumn(column);
                  }
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
