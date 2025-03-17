import 'package:flutter/material.dart';

class OverviewPageRow extends StatelessWidget {
  const OverviewPageRow({
    super.key,
    required this.id,
    required this.name,
    required this.columnValues,
  });

  final String id;
  final String name;

  /// {key: value}
  final Map<String, dynamic> columnValues;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
