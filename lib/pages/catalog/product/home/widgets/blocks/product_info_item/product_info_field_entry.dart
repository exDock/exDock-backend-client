import 'package:flutter/material.dart';

class ProductInfoFieldEntry extends StatelessWidget {
  const ProductInfoFieldEntry({
    super.key,
    required this.product,
    required this.columnName,
    required this.isBottomProduct,
    required this.isLastItem,
  });

  final Map<String, dynamic> product;
  final String columnName;
  final bool isBottomProduct;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    Radius topRightRadius = Radius.zero;
    Radius bottomRightRadius = Radius.zero;

    if (isLastItem) {
      if (isBottomProduct) {
        bottomRightRadius = const Radius.circular(20);
      } else {
        topRightRadius = const Radius.circular(7.5);
        bottomRightRadius = const Radius.circular(7.5);
      }
    }

    BorderRadius borderRadius = BorderRadius.only(
      topRight: topRightRadius,
      bottomRight: bottomRightRadius,
    );

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(color: Color(0xFF264653)),
          right: BorderSide(color: Color(0xFF264653)),
          bottom: BorderSide(color: Color(0xFF264653)),
        ),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          product["product_$columnName"].toString(),
          style: TextStyle(
            color: Color(0xFF264653),
          ),
        ),
      ),
    );
  }
}
