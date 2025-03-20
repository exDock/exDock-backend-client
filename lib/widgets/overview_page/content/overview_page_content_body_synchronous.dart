import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:flutter/material.dart';

class OverviewPageContentBodySynchronous extends StatelessWidget {
  const OverviewPageContentBodySynchronous({
    super.key,
    required this.rows,
    required this.tableWidth,
  });

  final List<OverviewPageRow> rows;
  final double tableWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: tableWidth,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: rows.length,
          itemBuilder: (context, index) {
            return rows[index];
          },
        ),
      ),
    );
  }
}
