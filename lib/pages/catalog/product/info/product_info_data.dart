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
  List<Category> categoryList;

  IdData({
    required this.sku,
    required this.location,
    required this.ean,
    required this.manufacturer,
    required this.categoryList,
  });
}

class Category {
  String name;

  Category({
    required this.name,
  });
}

class PriceData {
  double costPrice;
  double price;
  double salePrice;
  String taxClass;
  String startDate;
  String endDate;

  PriceData({
    required this.costPrice,
    required this.price,
    required this.salePrice,
    required this.taxClass,
    required this.startDate,
    required this.endDate,
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
  String directoryLocation;

  ImageData({
    required this.directoryLocation,
  });
}
