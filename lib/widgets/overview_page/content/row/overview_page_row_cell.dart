import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class OverviewPageRowCell extends StatelessWidget {
  const OverviewPageRowCell({
    super.key,
    required this.cellValue,
    required this.width,
    this.isLast = false,
  });

  final String? cellValue;
  final double width;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    Widget cell = Container(
      width: isLast ? width : null,
      decoration: BoxDecoration(
        border: Border(
          right: isLast
              ? BorderSide(
                  color: darkColour.withAlpha(50),
                  width: 1,
                )
              : BorderSide.none,
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

    if (isLast) return cell;

    return Container(
      width: width,
      decoration: DottedDecoration(
        shape: Shape.line,
        linePosition: LinePosition.right,
        dash: const [0, 5, 10, 5],
      ),
      child: cell,
    );
  }
}
