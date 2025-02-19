import 'package:flutter/material.dart';

class ColumnSplitter {
  /// Splits a list of widgets into two columns, balancing them by their rendered heights
  static (List<Widget>, List<Widget>) splitIntoBalancedColumns(
    List<Widget> widgets,
    BuildContext context,
  ) {
    final List<Widget> leftColumn = [];
    final List<Widget> rightColumn = [];
    double leftHeight = 0;
    double rightHeight = 0;

    // Get the available width for each column
    final double columnWidth = MediaQuery.of(context).size.width / 2;

    for (final widget in widgets) {
      // Create a temporary widget for measurement
      final Widget measuredWidget = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            constraints: BoxConstraints(maxWidth: columnWidth),
            child: widget,
          );
        },
      );

      // Get the render object
      final RenderObject? renderObject = context.findRenderObject();
      if (renderObject == null) continue;

      // Calculate approximate height based on intrinsic height
      // This is not perfect but provides a reasonable estimate
      final double widgetHeight =
          (renderObject as RenderBox).getMaxIntrinsicHeight(columnWidth);

      // Add to the column with lower height (or left if equal)
      if (leftHeight <= rightHeight) {
        leftColumn.add(widget);
        leftHeight += widgetHeight;
      } else {
        rightColumn.add(widget);
        rightHeight += widgetHeight;
      }
    }

    return (leftColumn, rightColumn);
  }
}
