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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(.5),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text("Last orders"),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Customer name"),
                      Text("Items"),
                      Text("Total"),
                    ],
                  ),
                  // TODO: stripe
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
