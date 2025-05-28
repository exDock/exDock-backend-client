String formatPrice(double? price) {
  const String currencySymbol = "€ "; // TODO: implement currencies
  if (price == null) return "$currencySymbol-";

  String priceString = price.toStringAsFixed(2);
  priceString = priceString.replaceAll(".", ",");
  priceString = priceString.replaceAll(",00", ",-");

  return "$currencySymbol$priceString";
}
