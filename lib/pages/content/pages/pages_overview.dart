// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/retrieve_overview_page_pages.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/overview_page.dart';

class PagesOverview extends StatefulWidget {
  const PagesOverview({super.key});

  @override
  State<PagesOverview> createState() => _PagesOverviewState();
}

class _PagesOverviewState extends State<PagesOverview> {
  final List<OverviewPageColumnData> visibleColumns = [];
  Set<String> allIds = {};
  late IdSetNotifier selectedIds = IdSetNotifier(allIds);

  Future<List<OverviewPageColumnData>> getPagesColumns() async {
    return [
      const OverviewPageColumnData(columnKey: "column_1", name: "Column 1"),
      const OverviewPageColumnData(columnKey: "column_2", name: "Column 2"),
      const OverviewPageColumnData(columnKey: "column_3", name: "Column 3"),
      const OverviewPageColumnData(columnKey: "column_4", name: "Column 4"),
    ];
  }

  Future<List<OverviewPageRow>> Function(
    FilterNotifier filters,
    List<OverviewPageColumnData>? columns,
    Set<String> allIds,
    IdSetNotifier selectedIds,
  ) getPagesRows() {
    Future<List<OverviewPageRow>> getRows(
      FilterNotifier filters,
      List<OverviewPageColumnData>? columns,
      Set<String> allIds,
      IdSetNotifier selectedIds,
    ) async =>
        [
          OverviewPageRow(
            id: 'page_1',
            name: "Page 1",
            visibleColumns: visibleColumns,
            columnValues: const {
              "column_1": "value_1",
              "column_2": "value_2",
              "column_3": "value_3",
            },
            allIds: allIds,
            selectedIds: selectedIds,
            onSelect: () {
              // ignore: avoid_print
              print("row selected: 1");
            },
          ),
          OverviewPageRow(
            id: 'page_2',
            name: "Page 2",
            visibleColumns: visibleColumns,
            columnValues: const {
              "column_1": "value_1",
              "column_2": "value_2",
            },
            allIds: allIds,
            selectedIds: selectedIds,
          ),
          OverviewPageRow(
            id: 'page_3',
            name: "Page 3",
            visibleColumns: visibleColumns,
            columnValues: const {
              "column_1": "value_1",
              "column_2": "value_2",
              "column_3": "value_3",
              "column_4": "value_4",
              "column_5": "value_5",
            },
            allIds: allIds,
            selectedIds: selectedIds,
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

  final FilterNotifier filters = FilterNotifier();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPagesOverviewData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return OverviewPage(
            columns: snapshot.data!['columns'],
            visibleColumns: visibleColumns,
            filters: filters,
            getPages: RetrieveOverviewPagePages(
              getRows: snapshot.data!['rows'],
              filters: filters,
              allIds: allIds,
              selectedIds: selectedIds,
            ),
            individualName: "page",
            allIds: allIds,
            selectedIds: selectedIds,
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("An error has occurred: ${snapshot.error.toString()}"),
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
