import 'package:exdock_backend_client/pages/home/home_data.dart';
import 'package:flutter/material.dart';

class HomeLastStatistics extends StatelessWidget {
  const HomeLastStatistics({
    super.key,
    required this.lastOrders,
    required this.lastSearches,
  });

  final List<HomeDataOrder> lastOrders;
  final List<HomeDataSearch> lastSearches;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
