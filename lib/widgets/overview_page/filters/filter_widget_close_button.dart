import 'package:flutter/material.dart';

class FilterWidgetCloseButton extends StatefulWidget {
  const FilterWidgetCloseButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  State<FilterWidgetCloseButton> createState() =>
      _FilterWidgetCloseButtonState();
}

class _FilterWidgetCloseButtonState extends State<FilterWidgetCloseButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IconButton(
        onPressed: widget.onPressed,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(
          maxHeight: 36,
          minHeight: 36,
        ),
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: TweenAnimationBuilder<Color?>(
          duration: const Duration(milliseconds: 150),
          tween: ColorTween(
            begin: null,
            end: _isHovered
                ? Colors.red
                : Theme.of(context).textTheme.bodyMedium!.color,
          ),
          builder: (context, color, child) {
            return Icon(
              Icons.close,
              size: 16,
              color: color,
            );
          },
        ),
      ),
    );
  }
}
