import 'package:exdock_backend_client/pages/catalog/product/new/product_info_card/new_product_card.dart';
import 'package:flutter/material.dart';

class NewProductCardTitle extends StatelessWidget {
  const NewProductCardTitle({
    super.key,
    this.width = double.infinity,
    required this.title,
    required this.child,
  });

  final double width;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NewProductCard(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
