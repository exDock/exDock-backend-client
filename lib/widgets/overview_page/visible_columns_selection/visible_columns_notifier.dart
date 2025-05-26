import 'package:exdock_backend_client/widgets/overview_page/content/columns/overview_page_column.dart';
import 'package:flutter/material.dart';

class VisibleColumnsNotifier
    extends ValueNotifier<List<OverviewPageColumnData>> {
  VisibleColumnsNotifier({
    required List<OverviewPageColumnData> visibleColumns,
  }) : super(visibleColumns);
  bool isChanged = false;

  bool containsColumn(OverviewPageColumnData column) {
    return value.contains(column);
  }

  void addColumn(OverviewPageColumnData column) {
    value.add(column);
    notifyListeners();
  }

  void removeColumn(OverviewPageColumnData column) {
    value.remove(column);
    notifyListeners();
  }

  void silentAddColumn(OverviewPageColumnData column) {
    isChanged = true;
    value.add(column);
  }

  void silentRemoveColumn(OverviewPageColumnData column) {
    isChanged = true;
    value.remove(column);
  }

  void notify({bool onlyIfChanged = false}) {
    if (onlyIfChanged && !isChanged) return;

    notifyListeners();
    isChanged = false;
  }
}
