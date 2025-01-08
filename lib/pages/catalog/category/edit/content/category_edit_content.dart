import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:flutter/material.dart';

class CategoryEditContent extends StatefulWidget {
  const CategoryEditContent({super.key, required this.selectedCategoryLeaf});

  final CategoryLeaf selectedCategoryLeaf;

  @override
  State<CategoryEditContent> createState() => _CategoryEditContentState();
}

class _CategoryEditContentState extends State<CategoryEditContent> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
