// Project imports:
import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_page.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/overview_page_row.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';
import 'package:exdock_backend_client/widgets/pagination/page_notifier.dart';

class RetrieveOverviewPagePages {
  RetrieveOverviewPagePages({
    required this.getRows,
    required this.filters,
    required this.allIds,
    required this.selectedIds,
    required this.pageNotifier,
    this.columns,
    this.pageSize = 10,
    this.currentPage = 0,
    this.cacheForwards = 0,
    this.cacheBackwards = 0,
  }) {
    for (int i = 1; i < currentPage; i++) {
      pages.add(null);
    }
  }

  final Future<List<OverviewPageRow>> Function(
    FilterNotifier filters,
    List<OverviewPageColumnData>? columns,
    Set<String> allIds,
    IdSetNotifier selectedIds,
    PageNotifier pageNotifier,
  ) getRows;
  final FilterNotifier filters;
  final Set<String> allIds;
  final IdSetNotifier selectedIds;
  final PageNotifier pageNotifier;

  final int pageSize;
  int currentPage;
  final List<OverviewPageColumnData>? columns;
  final int cacheForwards;
  final int cacheBackwards;
  final List<OverviewPagePage?> pages = [];

  Future<OverviewPagePage> getOverviewPagePage(
    int pageNumber, {
    bool strict = true,
  }) async {
    if (pages.length >= pageNumber && pages[pageNumber - 1] != null) {
      return pages[pageNumber - 1]!;
    }

    List<OverviewPageRow> rows = await getRows(
      filters,
      columns,
      allIds,
      selectedIds,
      pageNotifier,
    );
    OverviewPagePage overviewPagePage = OverviewPagePage(
      pageNumber: pageNumber,
      rows: rows,
      getRows: () {
        return getRows(
          filters,
          columns,
          allIds,
          selectedIds,
          pageNotifier,
        );
      },
    );

    if (pages.length <= pageNumber) {
      pages.add(overviewPagePage);
    } else {
      pages[pageNumber - 1] = overviewPagePage;
    }

    if (!strict && overviewPagePage.rows.isEmpty && pageNumber > 1) {
      return await getOverviewPagePage(pageNumber - 1, strict: false);
    }

    for (int i = 0; i < cacheForwards; i++) {
      if (pages.length > pageNumber + i && pages[pageNumber + i] == null) {
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
