import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class DropdownButtonFilters extends StatefulWidget {
  const DropdownButtonFilters(
      {super.key,
      required this.list,
      required this.icon,
      required this.isIconAtStart,
      required this.title,
      required this.width,
      required this.filterCallback});

  final List<String> list;
  final Icon icon;
  final bool isIconAtStart;
  final String title;
  final double width;
  final Function filterCallback;

  @override
  State<DropdownButtonFilters> createState() => _DropdownButtonFiltersState();
}

class _DropdownButtonFiltersState extends State<DropdownButtonFilters> {
  bool isExpanded = false; // Check if the list is expended

  OverlayEntry? _overlayEntry;

  void handleSelect(int index) {
    widget.filterCallback(widget.list[index]);
    _toggleOverlay();
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset(-100.0, -100.0));

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
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      handleSelect(index);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Text(widget.list[index]),
                    ),
                  );
                },
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
      } else {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      }
      isExpanded = !isExpanded;
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
      width: widget.width,
      child: GestureDetector(
        onTap: _toggleOverlay,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: kBoxShadowList,
          ),
          padding: EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.isIconAtStart) widget.icon,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "FILTERS",
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
