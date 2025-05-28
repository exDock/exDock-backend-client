// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/globals/styling.dart';
import 'package:exdock_backend_client/pages/catalog/product/home/widgets/top_bar/column_list.dart';

class DropdownButtonColumns extends StatefulWidget {
  const DropdownButtonColumns({
    super.key,
    required this.columnList,
    required this.icon,
    required this.isIconAtStart,
    required this.title,
    required this.selectedColumns,
    required this.deselectColumn,
    required this.setSelectedColumns,
  });

  final List<String> columnList;
  final List<String> selectedColumns;
  final Function deselectColumn;
  final Function setSelectedColumns;
  final Icon icon;
  final bool isIconAtStart;
  final String title;

  @override
  State<DropdownButtonColumns> createState() => _DropdownButtonColumnsState();
}

class _DropdownButtonColumnsState extends State<DropdownButtonColumns> {
  bool isExpanded = false; // Check if the list is expended

  final GlobalKey<ColumnListState> columnListKey = GlobalKey<ColumnListState>();

  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(const Offset(-100.0, -100.0));

    return OverlayEntry(
      builder: (context) => Positioned(
        top: position.dy + renderBox.size.height + 8,
        left: position.dx,
        width: renderBox.size.width,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TapRegion(
              onTapOutside: (tap) {
                _toggleOverlay();
              },
              child: ColumnList(
                columnList: widget.columnList,
                selectedColumns: widget.selectedColumns,
                deselectColumn: widget.deselectColumn,
                key: columnListKey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleOverlay() {
    setState(() {
      if (isExpanded) {
        _overlayEntry?.remove();
        _overlayEntry = null;
        widget.setSelectedColumns(columnListKey.currentState!.selectedColumns);
      } else {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      }

      Timer(const Duration(milliseconds: 100), () => isExpanded = !isExpanded);
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          if (!isExpanded) {
            _toggleOverlay();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: kBoxShadowList,
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.isIconAtStart) widget.icon,
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "COLUMNS",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              if (!widget.isIconAtStart) widget.icon,
            ],
          ),
        ),
      ),
    );
  }
}
