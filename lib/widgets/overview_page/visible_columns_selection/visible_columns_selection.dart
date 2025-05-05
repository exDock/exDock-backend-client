// Flutter imports:
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
  final List<OverviewPageColumnData> visibleColumns;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
