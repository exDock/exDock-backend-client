import 'package:exdock_backend_client/pages/home/home_data.dart';
import 'package:flutter/material.dart';

class HomeTopStatistics extends StatelessWidget {
  const HomeTopStatistics({
    super.key,
    required this.topProducts,
    required this.topSearches,
  });

  final List<HomeDataProduct> topProducts;
  final List<HomeDataSearch> topSearches;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
