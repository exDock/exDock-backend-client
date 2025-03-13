import 'package:flutter/material.dart';

class RemoveFilterButton extends StatelessWidget {
  const RemoveFilterButton({super.key, required this.removeFilterCallback});

  final Function removeFilterCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        removeFilterCallback();
      },
      child: Container(
        height: 70,
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(width: 2.0, color: Colors.grey),
          bottom: BorderSide(width: 2.0, color: Colors.grey),
        )),
        child: const Row(
          children: [
            Text("clear filters"),
            Padding(padding: EdgeInsets.only(right: 20)),
            Icon(Icons.close),
          ],
        ),
      ),
    );
  }
}
