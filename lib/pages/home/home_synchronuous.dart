import 'package:exdock_backend_client/pages/home/home_data.dart';
import 'package:exdock_backend_client/pages/home/widgets/home_global_statistics.dart';
import 'package:exdock_backend_client/pages/home/widgets/home_graph.dart';
import 'package:exdock_backend_client/pages/home/widgets/home_last_statistics.dart';
import 'package:exdock_backend_client/pages/home/widgets/home_top_statistics.dart';
import 'package:flutter/material.dart';

class HomeSynchronous extends StatelessWidget {
  const HomeSynchronous({super.key, required this.homeData});

  final HomeData homeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeGlobalStatistics(
                      lifetimeSales: homeData.lifetimeSales,
                      averageOrder: homeData.averageOrder,
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: HomeLastStatistics(
                        lastOrders: homeData.lastOrders,
                        lastSearches: homeData.lastSearches,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              const Flexible(child: HomeGraph()),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            HomeTopStatistics(
              topProducts: homeData.topProducts,
              topSearches: homeData.topSearches,
            ),
          ],
        ),
      ],
    );
  }
}
