import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExdockCloseIcon extends StatefulWidget {
  const ExdockCloseIcon({
    super.key,
    required this.onPressed,
    this.iconSize,
    this.padding,
  });

  final Function() onPressed;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  @override
  State<ExdockCloseIcon> createState() => _ExdockCloseIconState();
}

class _ExdockCloseIconState extends State<ExdockCloseIcon> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (PointerExitEvent event) {
        setState(() {
          _isHovering = false;
        });
      },
      child: IconButton(
        onPressed: widget.onPressed,
        iconSize: widget.iconSize,
        padding: widget.padding,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.close,
          color: _isHovering ? Colors.redAccent : null,
        ),
      ),
    );
  }
}
