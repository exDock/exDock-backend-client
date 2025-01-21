class ProductData {
  List<ProductInfo> products;

  ProductData({required this.products});
}

class ProductInfo {
  int id;
  String thumbnail;
  String name;
  double price;

  ProductInfo({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.price,
  });
}
