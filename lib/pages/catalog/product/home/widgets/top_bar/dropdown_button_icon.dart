// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backoffice/globals/globals.dart';

class DropdownButtonIcon extends StatefulWidget {
  const DropdownButtonIcon({
    super.key,
    required this.list,
    required this.icon,
    required this.isIconAtStart,
    required this.title,
  });

  final List<String> list;
  final Icon icon;
  final bool isIconAtStart;
  final String title;

  @override
  State<DropdownButtonIcon> createState() => _DropdownButtonIconState();
}

class _DropdownButtonIconState extends State<DropdownButtonIcon> {
  bool isExpanded = false; // Check if the list is expended
  bool isBaseValue = true; // Check if the list has been altered
  late String selectedValue;

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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = widget.list[index];
                        isBaseValue = false;
                        _toggleOverlay();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
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
    if (isBaseValue) selectedValue = widget.title;

    return SizedBox(
      child: GestureDetector(
        onTap: _toggleOverlay,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    selectedValue,
                    style: const TextStyle(color: Colors.black),
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
