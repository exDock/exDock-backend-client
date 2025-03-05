import 'package:flutter/material.dart';

/// Shows a custom snackbar with a card layout and fade in/out animations
void showExDockSnackBar({
  required BuildContext context,
  required Widget child,
  Duration? duration,
}) {
  print("showExDockSnackBar called");
  // Default duration if not provided
  final snackBarDuration = duration ?? const Duration(seconds: 3);

  // Get the scaffold messenger
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  // Hide any existing snackbars
  scaffoldMessenger.hideCurrentSnackBar();

  // Create a widget that handles its own animations
  final snackBarContent = _FadingSnackBarContent(
    child: child,
    duration: snackBarDuration,
  );

  // Create the custom snackbar
  final snackBar = SnackBar(
    content: snackBarContent,
    duration: snackBarDuration +
        const Duration(milliseconds: 600), // Add time for fade in/out
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    padding: const EdgeInsets.only(
      bottom: 24,
      left: 24,
      right: 24,
    ),
    margin: EdgeInsets.zero,
  );

  // Show the snackbar
  scaffoldMessenger.showSnackBar(snackBar);
}

/// A widget that handles its own fade in/out animations
class _FadingSnackBarContent extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const _FadingSnackBarContent({
    required this.child,
    required this.duration,
  });

  @override
  State<_FadingSnackBarContent> createState() => _FadingSnackBarContentState();
}

class _FadingSnackBarContentState extends State<_FadingSnackBarContent>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Create animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Create fade animation
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start fade-in animation
    _controller.forward();

    // Schedule fade-out animation after the duration
    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Card(
        color: Theme.of(context).indicatorColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
