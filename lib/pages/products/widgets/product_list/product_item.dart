import 'package:flutter/material.dart';

import '../../product_data.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final ProductInfo product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool selectedIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1600,
      height: 40,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF264653)),
          borderRadius: BorderRadius.all(Radius.circular(7.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Color(0xFF264653)))),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = !selectedIcon;
                  });
                },
                child: Icon(
                  selectedIcon
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  color: Color(0xFF264653),
                ),
              )),
          Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Color(0xFF264653)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.product.id.toString(),
                  style: TextStyle(color: Color(0xFF264653)),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            width: 140,
            decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Color(0xFF264653)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.product.thumbnail,
                  style: TextStyle(color: Color(0xFF264653)),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Color(0xFF264653)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(color: Color(0xFF264653)),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
