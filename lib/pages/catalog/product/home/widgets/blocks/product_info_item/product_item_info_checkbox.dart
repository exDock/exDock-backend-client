import 'package:flutter/material.dart';

class ProductItemInfoCheckbox extends StatelessWidget {
  const ProductItemInfoCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: const BoxDecoration(
        color: Color(0xFF264653),
        border: Border(
          top: BorderSide(color: Colors.white),
          right: BorderSide(color: Colors.white),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(7.5),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.check_box_outline_blank,
          color: Colors.white,
        ),
      ),
    );
  }
}
