import 'package:exdock_backend_client/pages/catalog/attributes/single_image_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/content/blocks/category_edit_content_blocks.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/content/group_cards/category_edit_group_card_with_title.dart';
import 'package:flutter/material.dart';

class CategoryEditContentSynchronous extends StatefulWidget {
  const CategoryEditContentSynchronous({super.key, required this.blocks});

  final Map<String, dynamic> blocks;

  @override
  State<CategoryEditContentSynchronous> createState() =>
      _CategoryEditContentSynchronousState();
}

class _CategoryEditContentSynchronousState
    extends State<CategoryEditContentSynchronous> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CategoryEditContentBlocks(blocks: widget.blocks),
    );
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
                    child: Column(
                      children: [
                        SingleImageAttribute(),
                      ],
                    ),
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
