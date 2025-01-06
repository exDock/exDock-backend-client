import 'dart:math';

import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/category_edit.dart';
import 'package:exdock_backend_client/pages/catalog/category/selection_bar/sub_category_row.dart';
import 'package:exdock_backend_client/pages/catalog/category/selection_bar/top_category_row.dart';
import 'package:flutter/material.dart';

class CategorySynchronous extends StatefulWidget {
  const CategorySynchronous({super.key, required this.categoryTree});

  final CategoryTree categoryTree;

  @override
  State<CategorySynchronous> createState() => _CategorySynchronousState();
}

class _CategorySynchronousState extends State<CategorySynchronous> {
  List<CategoryLeaf> categorySelection = [];
  int selectedCategory = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (categorySelection.isNotEmpty &&
                  categorySelection.last.subLeaves != null)
              ? 72 + categorySelection.length * 48
              : max(72 + (categorySelection.length - 1) * 48, 72),
          child: Stack(
            children: List.generate(
              (categorySelection.isEmpty ||
                      categorySelection.last.subLeaves != null)
                  ? categorySelection.length + 1
                  : categorySelection.length,
              (index) {
                if (categorySelection.isEmpty || index == 0) {
                  return TopCategoryRow(
                    onPressed: (int rowIndex) {
                      selectedCategory =
                          widget.categoryTree.leaves[rowIndex].id;
                      if (index < categorySelection.length) {
                        categorySelection[index] =
                            widget.categoryTree.leaves[rowIndex];
                        categorySelection =
                            categorySelection.sublist(0, index + 1);
                      } else {
                        categorySelection
                            .add(widget.categoryTree.leaves[rowIndex]);
                      }
                      setState(() {});
                    },
                    categoryTree: widget.categoryTree,
                    categorySelection: categorySelection,
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(top: 72 + (index - 1) * 48),
                  child: SubCategoryRow(
                    onPressed: (int rowIndex) {
                      selectedCategory =
                          categorySelection[index - 1].subLeaves![rowIndex].id;
                      if (index < categorySelection.length) {
                        categorySelection[index] =
                            categorySelection[index - 1].subLeaves![rowIndex];
                        categorySelection =
                            categorySelection.sublist(0, index + 1);
                      } else {
                        categorySelection.add(
                            categorySelection[index - 1].subLeaves![rowIndex]);
                      }
                      setState(() {});
                    },
                    previousLeaf: categorySelection[index - 1],
                    currentSelectedCategoryLeaf:
                        categorySelection.length >= index + 1
                            ? categorySelection[index]
                            : null,
                  ),
                );
              },
            ).reversed.toList(),
          ),
        ),
        Expanded(
          child: CategoryEdit(categoryId: selectedCategory),
        ),
      ],
    );
  }
}
