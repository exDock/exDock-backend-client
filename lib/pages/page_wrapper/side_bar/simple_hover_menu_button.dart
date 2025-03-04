import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleHoverMenuButton extends StatelessWidget {
  const SimpleHoverMenuButton({
    super.key,
    required this.route,
    required this.buttonText,
  });

  final String route;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => context.push(route),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
