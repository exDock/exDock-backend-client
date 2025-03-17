import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content_body_synchronous.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:flutter/material.dart';

class OverviewPageContentBody extends StatelessWidget {
  const OverviewPageContentBody({
    super.key,
    required this.columnsToRetrieve,
    required this.getRows,
    required this.filters,
  });

  final List<OverviewPageColumn> columnsToRetrieve;
  final Future<List<OverviewPageRow>> Function(
    List<Filter> filters,
    List<OverviewPageColumn>? columns,
  ) getRows;
  final List<Filter> filters;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRows(filters, columnsToRetrieve),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return OverviewPageContentBodySynchronous(
            rows: snapshot.data!,
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("an error occurred: ${snapshot.error.toString()}"),
          );
        }

        // TODO: replace with exdock page loading widget once available on main
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
