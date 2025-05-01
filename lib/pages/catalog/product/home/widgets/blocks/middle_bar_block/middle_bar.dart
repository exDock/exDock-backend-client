import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

import 'filter_list.dart';
import 'product_view_size.dart';
import 'remove_filter_button.dart';

class MiddleBar extends StatelessWidget {
  const MiddleBar({
    super.key,
    required this.height,
    required this.block,
    required this.mapNotifier,
  });

  final double height;
  final MapEntry<String, dynamic> block;
  final MapNotifier mapNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(left: 16.0, top: 40.0),
      child: Row(
        children: [
          FilterList(
            mapNotifier: mapNotifier,
          ),
          RemoveFilterButton(
            mapNotifier: mapNotifier,
          ),
          ProductViewSize(
            mapNotifier: mapNotifier,
          ),
        ],
      ),
    );
  }
}
