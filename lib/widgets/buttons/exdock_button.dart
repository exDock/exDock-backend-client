import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class ExdockButton extends StatefulWidget {
  const ExdockButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.hoverColor,
    this.icon,
  });

  final String label;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? hoverColor;
  final IconData? icon;

  @override
  State<ExdockButton> createState() => _ExdockButtonState();
}

class _ExdockButtonState extends State<ExdockButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      widget.label,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).indicatorColor,
          ),
    );
    if (widget.icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          const SizedBox(width: 12),
          Icon(widget.icon!, color: Theme.of(context).indicatorColor),
        ],
      );
    }
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.hoverColor ?? darkColour
              : widget.backgroundColor ?? mainColour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(EdgeInsets.all(24)),
            backgroundColor: WidgetStateProperty.all(Colors
                .transparent), // Transparent to show AnimatedContainer color
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            elevation:
                WidgetStateProperty.all(0), // Remove default button elevation
          ),
          child: child,
        ),
      ),
    );
  }
}
