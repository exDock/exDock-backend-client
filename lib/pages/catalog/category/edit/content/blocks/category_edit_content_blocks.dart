import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryEditContentBlocks extends StatefulWidget {
  const CategoryEditContentBlocks({
    super.key,
    required this.blocks,
    required this.changeAttributeMap,
  });

  final List<Widget> blocks;
  final MapNotifier changeAttributeMap;

  @override
  State<CategoryEditContentBlocks> createState() =>
      _CategoryEditContentBlocksState();
}

class _CategoryEditContentBlocksState extends State<CategoryEditContentBlocks> {
  final List<Widget> leftColumn = [];
  final List<Widget> rightColumn = [];
  double leftHeight = 0;
  double rightHeight = 0;

  @override
  void initState() {
    super.initState();

    _splitWidgets();
  }

  void _splitWidgets() {
    for (var widget in widget.blocks) {
      double widgetHeight = _getWidgetHeight(widget);

      if (leftHeight <= rightHeight) {
        leftColumn.add(widget);
        leftHeight += widgetHeight;
      } else {
        rightColumn.add(widget);
        rightHeight += widgetHeight;
      }
    }
    setState(() {}); // Trigger rebuild
  }

  double _getWidgetHeight(Widget widget) {
    if (widget is SizedBox && widget.height != null) {
      return widget.height!;
    }
    return 50.0; // Default estimated height (adjust as needed)
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: MasonryGridView.count(
          padding: const EdgeInsets.all(24),
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: widget.blocks.length,
          itemBuilder: (context, index) {
            return widget.blocks[index];
          },
        ),
      ),
    );
  }
}
