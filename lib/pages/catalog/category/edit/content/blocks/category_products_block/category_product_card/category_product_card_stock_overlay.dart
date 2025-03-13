import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class CategoryProductCardStockOverlay extends StatelessWidget {
  const CategoryProductCardStockOverlay({
    super.key,
    required this.stock,
    this.height,
  });

  final int stock;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: stock != 0 ? Theme.of(context).indicatorColor : Colors.red,
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
            boxShadow: kBoxShadowList),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "stock: $stock",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: stock == 0 ? Colors.white : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
