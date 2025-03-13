import 'package:exdock_backend_client/widgets/loading/exdock_loading_animation.dart';
import 'package:flutter/material.dart';

class ExdockLoadingPageAnimation extends StatelessWidget {
  const ExdockLoadingPageAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    // Ability to customise in the future
    return Center(
      child: ExdockLoadingAnimation(),
    );
  }
}
