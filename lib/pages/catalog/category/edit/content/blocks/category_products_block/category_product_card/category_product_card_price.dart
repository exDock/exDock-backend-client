import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/utils/price_formatting.dart';
import 'package:flutter/material.dart';

class CategoryProductCardPrice extends StatelessWidget {
  const CategoryProductCardPrice({
    super.key,
    required this.price,
    this.salePrice,
  });

  final double price;
  final double? salePrice;

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();
    final Color stripedColour = Colors.grey.shade500;

    TextStyle priceTextStyle =
        (Theme.of(context).textTheme.bodyMedium ?? TextStyle())
            .copyWith(color: Colors.white);
    TextStyle stripedPriceTextStyle =
        (Theme.of(context).textTheme.bodyMedium ?? TextStyle()).copyWith(
      color: stripedColour,
      decoration: TextDecoration.lineThrough,
      decorationColor: stripedColour,
    );

    // Measure text width using formatted prices
    final String formattedPrice = formatPrice(price);
    final String formattedSalePrice =
        salePrice != null ? formatPrice(salePrice!) : '';

    final TextPainter pricePainter = TextPainter(
      text: TextSpan(text: formattedPrice, style: priceTextStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    final TextPainter salePainter = TextPainter(
      text: TextSpan(text: formattedSalePrice, style: priceTextStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    double containerWidth = salePrice != null
        ? (pricePainter.width > salePainter.width
            ? pricePainter.width
            : salePainter.width)
        : pricePainter.width;

    containerWidth += 18; // Add some padding

    if (salePrice == null) {
      child = Container(
        width: containerWidth,
        padding: const EdgeInsets.all(8),
        color: mainColour,
        alignment: Alignment.centerRight,
        child: Text(formattedPrice, style: priceTextStyle),
      );
    } else {
      child = Column(
        children: [
          Container(
            width: containerWidth,
            padding: const EdgeInsets.all(8),
            color: darkColour,
            alignment: Alignment.centerRight,
            child: Text(formattedPrice, style: stripedPriceTextStyle),
          ),
          Container(
            width: containerWidth,
            padding: const EdgeInsets.all(8),
            color: mainColour,
            alignment: Alignment.centerRight,
            child: Text(formattedSalePrice, style: priceTextStyle),
          ),
        ],
      );
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
      ),
      child: child,
    );
  }
}
