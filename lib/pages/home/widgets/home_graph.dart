import 'package:flutter/material.dart';

class HomeGraph extends StatelessWidget {
  const HomeGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(.5))
        ],
      ),
      child: const Center(
        child: Text("GRAPH"),
      ),
    );
  }
}
