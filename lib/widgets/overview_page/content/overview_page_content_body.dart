// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/overview_page_content_body_synchronous.dart';
import 'package:exdock_backend_client/widgets/overview_page/content/row/retrieve_overview_page_pages.dart';
import 'package:exdock_backend_client/widgets/overview_page/filters/filter_notifier.dart';

class OverviewPageContentBody extends StatelessWidget {
  const OverviewPageContentBody({
    super.key,
    required this.columnsToRetrieve,
    required this.getPages,
    required this.filters,
    required this.tableWidth,
    required this.allIds,
    required this.selectedIds,
  });

  final List<OverviewPageColumn> columnsToRetrieve;
  final RetrieveOverviewPagePages getPages;
  final FilterNotifier filters;
  final double tableWidth;
  final Set<String> allIds;
  final IdSetNotifier selectedIds;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPages.getOverviewPagePage(1), // TODO: make page number dynamic
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return OverviewPageContentBodySynchronous(
            page: snapshot.data!,
            tableWidth: tableWidth,
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
