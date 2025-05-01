import 'package:flutter/material.dart';

class ProductInfoCheckboxEntry extends StatelessWidget {
  const ProductInfoCheckboxEntry({
    super.key,
    required this.isBottomCheckbox,
  });

  final bool isBottomCheckbox;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = isBottomCheckbox
        ? const BorderRadius.only(
            topLeft: Radius.circular(7.5),
            bottomLeft: Radius.circular(20),
          )
        : const BorderRadius.only(
            bottomLeft: Radius.circular(7.5),
            topLeft: Radius.circular(7.5),
          );

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFF264653),
        ),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Icon(
          Icons.check_box_outline_blank,
          color: Color(0xFF264653),
        ),
      ),
    );
  }
}
