import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_page.dart';
import 'package:flutter/material.dart';

class OverviewPageContentBodySynchronous extends StatelessWidget {
  const OverviewPageContentBodySynchronous({
    super.key,
    required this.page,
    required this.tableWidth,
  });

  final OverviewPagePage page;
  final double tableWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: tableWidth,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: page.rows.length,
          itemBuilder: (context, index) {
            return page.rows[index];
          },
        ),
      ),
    );
  }
}
