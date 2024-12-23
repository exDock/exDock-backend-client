import 'package:flutter/material.dart';

class CategoryEdit extends StatefulWidget {
  const CategoryEdit({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<CategoryEdit> createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  @override
  Widget build(BuildContext context) {
    if (widget.categoryId == -1) return const Placeholder();

    return Placeholder(
      child: Text(
        widget.categoryId.toString(),
      ),
    );
  }
}
