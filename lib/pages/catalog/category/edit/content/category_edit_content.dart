import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/content/group_cards/category_edit_group_card_with_title.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  CategoryEditGroupCardWithTitle(
                    title: "Content",
                    unsavedChangesNotifier: ValueNotifier<bool>(true),
                    child: const SizedBox(height: 250),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
                  CategoryEditGroupCardWithTitle(
                    title: "Search Engine Optimisation",
                    unsavedChangesNotifier: ValueNotifier<bool>(false),
                    child: const SizedBox(height: 250),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
