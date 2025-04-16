import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_page.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';

class RetrieveOverviewPagePages {
  RetrieveOverviewPagePages({
    required this.getRows,
    required this.filters,
    this.columns,
    this.pageSize = 10,
    this.currentPage = 1,
    this.cacheForwards = 0,
    this.cacheBackwards = 0,
  }) {
    for (int i = 1; i < currentPage; i++) {
      pages.add(null);
    }
  }

  final int pageSize;
  int currentPage;
  final FilterNotifier filters;
  final List<OverviewPageColumn>? columns;
  final Future<List<OverviewPageRow>> Function(
    int pageSize,
    int currentPage,
    FilterNotifier filters,
    List<OverviewPageColumn>? columns,
  ) getRows;
  final int cacheForwards;
  final int cacheBackwards;
  final List<OverviewPagePage?> pages = const [];

  Future<OverviewPagePage> getOverviewPagePage(
    int pageNumber, {
    bool strict = true,
  }) async {
    while (pageNumber >= pages.length) {
      return pages[pageNumber - 1]!;
    }

    if (pages[pageNumber - 1] != null) {
      return pages[pageNumber - 1]!;
    }

    List<OverviewPageRow> rows = await getRows(
      pageSize,
      pageNumber,
      filters,
      columns,
    );
    OverviewPagePage overviewPagePage = OverviewPagePage(
      pageNumber: pageNumber,
      rows: rows,
      getRows: () {
        return getRows(
          pageSize,
          pageNumber,
          filters,
          columns,
        );
      },
    );

    pages[pageNumber - 1] = overviewPagePage;

    if (!strict && overviewPagePage.rows.isEmpty && pageNumber > 1) {
      return await getOverviewPagePage(pageNumber - 1, strict: false);
    }

    for (int i = 0; i < cacheForwards; i++) {
      if (pages[pageNumber + i] == null) {
        cachePage(pageNumber + i);
      }
    }

    for (int i = 0; i < cacheBackwards; i++) {
      if (pageNumber - i > 0 && pages[pageNumber - i] == null) {
        cachePage(pageNumber - i);
      }
    }

    return overviewPagePage;
  }

  Future<OverviewPagePage> cachePage(int pageNumber) async {
    return pages[pageNumber - 1] = await getOverviewPagePage(pageNumber);
  }
}
