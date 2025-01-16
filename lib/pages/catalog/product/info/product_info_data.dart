class ProductInfoData {
  IdData idData;
  PriceData priceData;
  ContentData contentData;
  ImageData imageData;

  ProductInfoData({
    required this.idData,
    required this.priceData,
    required this.contentData,
    required this.imageData,
  });
}

class IdData {
  String sku;
  String location;
  String ean;
  String manufacturer;
  List<CategoryData> categories;

  IdData({
    required this.sku,
    required this.location,
    required this.ean,
    required this.manufacturer,
    required this.categories,
  });
}

class PriceData {
  double costPrice;
  String taxClass;
  double price;
  double salePrice;
  String saleDateStart;
  String saleDateEnd;

  PriceData({
    required this.costPrice,
    required this.taxClass,
    required this.price,
    required this.salePrice,
    required this.saleDateStart,
    required this.saleDateEnd,
  });
}

class ContentData {
  String description;
  String shortDescription;

  ContentData({
    required this.description,
    required this.shortDescription,
  });
}

class ImageData {
  String url;
  List<String> extensions;

  ImageData({
    required this.url,
    required this.extensions,
  });
}

class CategoryData {
  String name;

  CategoryData({
    required this.name,
  });
}
