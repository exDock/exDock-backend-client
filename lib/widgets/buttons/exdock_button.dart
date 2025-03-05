import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class ExdockButton extends StatefulWidget {
  const ExdockButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.hoverColor,
  });

  final String label;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? hoverColor;

  @override
  State<ExdockButton> createState() => _ExdockButtonState();
}

class _ExdockButtonState extends State<ExdockButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
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
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
          ),
        ),
      ),
    );
  }
}
