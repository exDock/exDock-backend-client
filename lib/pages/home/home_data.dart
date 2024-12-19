class HomeData {
  double lifetimeSales;
  double averageOrder;
  List<HomeDataOrder> lastOrders;
  List<HomeDataSearch> lastSearches;
  List<HomeDataProduct> topProducts;
  List<HomeDataSearch> topSearches;
  // TODO: graph data

  HomeData({
    required this.lifetimeSales,
    required this.averageOrder,
    required this.lastOrders,
    required this.lastSearches,
    required this.topProducts,
    required this.topSearches,
  });
}

class HomeDataOrder {
  String customerName;
  int itemCount;
  double totalAmount;

  HomeDataOrder({
    required this.customerName,
    required this.itemCount,
    required this.totalAmount,
  });
}

class HomeDataSearch {
  String searchTerm;
  int results;
  int uses;

  HomeDataSearch({
    required this.searchTerm,
    required this.results,
    required this.uses,
  });
}

class HomeDataProduct {
  String productName;
  double price;

  HomeDataProduct({
    required this.productName,
    required this.price,
  });
}
