// Flutter imports:
import 'package:flutter/material.dart';

class PageNotifier extends ValueNotifier<int> {
  PageNotifier({
    this.pageSize = 10,
    int? initialPage,
  }) : super(initialPage ?? 0);

  int? maxPage;
  int pageSize;

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }

  void setPage(int page) {
    value = page;
    notifyListeners();
  }

  bool get canIncrement {
    if (maxPage == null) return false;

    return value < maxPage!;
  }

  bool get canDecrement {
    return value > 0;
  }
}
