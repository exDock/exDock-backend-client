import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class OverviewPageRowCell extends StatelessWidget {
  const OverviewPageRowCell({
    super.key,
    required this.cellValue,
    required this.width,
  });

  final String? cellValue;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            // TODO: make this dotted
            color: darkColour.withAlpha(50),
            width: 1,
          ),
          bottom: BorderSide(
            color: darkColour.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(cellValue ?? "-"),
      ),
    );
  }
}
