import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class NewProductCard extends StatelessWidget {
  const NewProductCard({
    super.key,
    this.width = double.infinity,
    required this.child,
  });

  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: kBoxShadowList,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: child,
          ),
        ],
      ),
    );
  }
}
