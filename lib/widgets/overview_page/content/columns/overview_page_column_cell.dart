import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class OverviewPageColumnCell extends StatelessWidget {
  const OverviewPageColumnCell({
    super.key,
    required this.columnName,
    this.columnKey,
    this.onColumnSort,
    required this.width,
  });

  final String columnName;
  final String? columnKey;
  final Function(bool ascending)? onColumnSort;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: darkColour,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            columnName,
            style: TextStyle(color: Theme.of(context).indicatorColor),
          ),
        ),
      ),
    );
  }
}
