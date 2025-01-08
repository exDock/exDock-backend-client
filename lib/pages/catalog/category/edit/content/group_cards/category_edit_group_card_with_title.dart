import 'package:exdock_backend_client/pages/catalog/category/edit/content/group_cards/category_edit_group_card.dart';
import 'package:flutter/material.dart';

class CategoryEditGroupCardWithTitle extends StatelessWidget {
  const CategoryEditGroupCardWithTitle({
    super.key,
    this.width = double.infinity,
    required this.title,
    required this.unsavedChangesNotifier,
    required this.child,
  });

  final double width;
  final String title;
  final ValueNotifier<bool> unsavedChangesNotifier;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CategoryEditGroupCard(
      width: width,
      unsavedChangesNotifier: unsavedChangesNotifier,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
