class ProductData {
  List<ProductInfo> products;

  ProductData({required this.products});
}

class ProductInfo {
  int id;
  String thumbnail;
  String name;

  ProductInfo({
    required this.id,
    required this.thumbnail,
    required this.name,
  });
}
