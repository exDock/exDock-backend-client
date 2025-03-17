import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter.dart';
import 'package:exdock_backend_client/widgets/overview_page/overview_page.dart';
import 'package:flutter/material.dart';

class PagesOverview extends StatelessWidget {
  const PagesOverview({super.key});

  Future<List<OverviewPageColumn>> getPagesColumns() async {
    return [
      const OverviewPageColumn(columnKey: "column_1", name: "Column 1"),
      const OverviewPageColumn(columnKey: "column_2", name: "Column 2"),
      const OverviewPageColumn(columnKey: "column_3", name: "Column 3"),
      const OverviewPageColumn(columnKey: "column_4", name: "Column 4"),
    ];
  }

  Future<List<OverviewPageRow>> Function(
    List<Filter> filters,
    List<OverviewPageColumn>? columns,
  ) getPagesRows() {
    Future<List<OverviewPageRow>> getRows(
      List<Filter> filters,
      List<OverviewPageColumn>? columns,
    ) async =>
        [
          const OverviewPageRow(
            id: 'page_1',
            name: "Page 1",
            columnValues: {
              "column_1": "value_1",
              "column_2": "value_2",
              "column_3": "value_3",
            },
          ),
          const OverviewPageRow(
            id: 'page_2',
            name: "Page 2",
            columnValues: {
              "column_1": "value_1",
              "column_2": "value_2",
            },
          ),
          const OverviewPageRow(
            id: 'page_3',
            name: "Page 3",
            columnValues: {
              "column_1": "value_1",
              "column_2": "value_2",
              "column_3": "value_3",
              "column_4": "value_4",
              "column_5": "value_5",
            },
          )
        ];

    return getRows;
  }

  Future<Map<String, dynamic>> getPagesOverviewData() async {
    return {
      "columns": await getPagesColumns(),
      "rows": getPagesRows(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPagesOverviewData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return OverviewPage(
            columns: snapshot.data!['columns'],
            getRows: snapshot.data!['rows'],
          );
        }

        // TODO: replace this with ExdockLoadingPageAnimation once available on the main branch
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
