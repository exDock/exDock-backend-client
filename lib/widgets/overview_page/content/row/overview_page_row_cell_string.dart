import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row_cell.dart';
import 'package:flutter/material.dart';

class OverviewPageRowCellString extends StatelessWidget {
  const OverviewPageRowCellString(
      {super.key, this.cellValue, required this.width, this.isLast});

  final String? cellValue;
  final double width;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return OverviewPageRowCell(
      cellValue: cellValue != null ? Text(cellValue!) : null,
      width: width,
    );
  }
}
