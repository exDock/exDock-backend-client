import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:flutter/material.dart';

class CategoryEdit extends StatefulWidget {
  const CategoryEdit({super.key, required this.categorySelection});

  final List<CategoryLeaf> categorySelection;

  @override
  State<CategoryEdit> createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  @override
  Widget build(BuildContext context) {
    if (widget.categorySelection.isEmpty) {
      return const Placeholder(
        child: Text("no category selected"),
      );
    }

    return Placeholder(
      child: Text(
        widget.categorySelection.last.id.toString(),
      ),
    );
  }
}
