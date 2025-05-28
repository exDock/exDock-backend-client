// Flutter imports:
import 'package:flutter/material.dart';

class HomeGlobalStatistics extends StatelessWidget {
  const HomeGlobalStatistics({
    super.key,
    required this.lifetimeSales,
    required this.averageOrder,
  });

  final double lifetimeSales;
  final double averageOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeGlobalStatistic(title: "Lifetime sales", amount: lifetimeSales),
        const SizedBox(height: 24),
        HomeGlobalStatistic(title: "Average order", amount: averageOrder),
      ],
    );
  }
}

class HomeGlobalStatistic extends StatelessWidget {
  const HomeGlobalStatistic({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final double amount;

  String formatDouble(double input) {
    final String inputString = input.toStringAsFixed(2);
    final List<String> splitInput = inputString.split(".");
    if (splitInput[1] == "00") splitInput[1] = "-";

    // TODO: splitInput
    final String reversedInput = splitInput[0].split('').reversed.join('');

    // Add dots every 3 characters
    final String processed = reversedInput.replaceAllMapped(
        RegExp(r'.{1,3}'), (match) => '${match.group(0)}.');

    // Reverse back and remove the trailing dot if present
    splitInput[0] = processed.split('').reversed.join().replaceFirst('.', '');

    return splitInput.join(",");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "€ ${formatDouble(amount)}",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
