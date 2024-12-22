import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:flutter/material.dart';

class CategorySynchronous extends StatefulWidget {
  const CategorySynchronous({super.key, required this.categoryData});

  final CategoryData categoryData;

  @override
  State<CategorySynchronous> createState() => _CategorySynchronousState();
}

class _CategorySynchronousState extends State<CategorySynchronous> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
