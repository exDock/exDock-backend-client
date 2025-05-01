import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class ProductInfoItemName extends StatelessWidget {
  const ProductInfoItemName({
    super.key,
    required this.itemName,
    required this.mapNotifier,
    required this.isLastItem,
  });

  final String itemName;
  final MapNotifier mapNotifier;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = isLastItem
        ? const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(7.5),
          )
        : const BorderRadius.all(Radius.circular(0));
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF264653),
        border: Border(
          top: BorderSide(color: Colors.white),
          right: BorderSide(color: Colors.white),
        ),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          itemName,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
