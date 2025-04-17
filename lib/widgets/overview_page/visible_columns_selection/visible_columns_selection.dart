import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:flutter/material.dart';

class VisibleColumnsSelection extends StatelessWidget {
  const VisibleColumnsSelection({
    super.key,
    required this.columns,
    required this.visibleColumns,
  });

  final List<OverviewPageColumn> columns;
  final List<OverviewPageColumn> visibleColumns;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
