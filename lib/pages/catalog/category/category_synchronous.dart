import 'dart:math';

import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/category_edit.dart';
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

class SubCategoryRow extends StatelessWidget {
  const SubCategoryRow({
    super.key,
    required this.onPressed,
    required this.previousLeaf,
    this.currentSelectedCategoryLeaf,
  });

  final Function(int) onPressed;
  final CategoryLeaf previousLeaf;
  final CategoryLeaf? currentSelectedCategoryLeaf;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        boxShadow: kBoxShadowList,
      ),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(width: double.infinity),
          ),
          Flexible(
            flex: 4,
            child: Row(
              mainAxisAlignment: previousLeaf.subLeaves!.length > 1
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: List<Widget>.generate(
                previousLeaf.subLeaves!.length,
                (rowIndex) {
                  return TextButton(
                    onPressed: () {
                      onPressed(rowIndex);
                    },
                    child: Text(
                      previousLeaf.subLeaves![rowIndex].name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: currentSelectedCategoryLeaf != null &&
                                    previousLeaf.subLeaves![rowIndex].id ==
                                        currentSelectedCategoryLeaf!.id
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                    ),
                  );
                },
              ),
            ),
          ),
          Flexible(
            child: SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class TopCategoryRow extends StatelessWidget {
  const TopCategoryRow({
    super.key,
    required this.onPressed,
    required this.categoryTree,
    required this.categorySelection,
  });

  final Function(int) onPressed;
  final CategoryTree categoryTree;
  final List<CategoryLeaf> categorySelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Color(0xff264653),
        boxShadow: kBoxShadowList,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 9,
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                categoryTree.leaves.length,
                (rowIndex) {
                  return TextButton(
                    onPressed: () {
                      onPressed(rowIndex);
                    },
                    child: Text(
                      categoryTree.leaves[rowIndex].name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: categorySelection.isNotEmpty &&
                                    categorySelection[0].id ==
                                        categoryTree.leaves[rowIndex].id
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                    ),
                  );
                },
              ),
            ),
          ),
          Flexible(
            flex: 9,
            child: SizedBox(
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
