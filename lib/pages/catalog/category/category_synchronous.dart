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
                              widget.categoryTree.leaves.length,
                              (rowIndex) {
                                return TextButton(
                                  onPressed: () {
                                    selectedCategory =
                                        widget.categoryTree.leaves[rowIndex].id;
                                    if (index < categorySelection.length) {
                                      categorySelection[index] =
                                          widget.categoryTree.leaves[rowIndex];
                                      categorySelection = categorySelection
                                          .sublist(0, index + 1);
                                    } else {
                                      categorySelection.add(
                                          widget.categoryTree.leaves[rowIndex]);
                                    }
                                    setState(() {});
                                  },
                                  child: Text(
                                    widget.categoryTree.leaves[rowIndex].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: Colors.white),
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
                return Padding(
                  padding: EdgeInsets.only(top: 72 + (index - 1) * 48),
                  child: Container(
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
                            mainAxisAlignment:
                                categorySelection[index - 1].subLeaves!.length >
                                        1
                                    ? MainAxisAlignment.spaceBetween
                                    : MainAxisAlignment.center,
                            children: List<Widget>.generate(
                              categorySelection[index - 1].subLeaves!.length,
                              (rowIndex) {
                                return TextButton(
                                  onPressed: () {
                                    selectedCategory =
                                        categorySelection[index - 1]
                                            .subLeaves![rowIndex]
                                            .id;
                                    if (index < categorySelection.length) {
                                      categorySelection[index] =
                                          categorySelection[index - 1]
                                              .subLeaves![rowIndex];
                                      categorySelection = categorySelection
                                          .sublist(0, index + 1);
                                    } else {
                                      categorySelection.add(
                                          categorySelection[index - 1]
                                              .subLeaves![rowIndex]);
                                    }
                                    setState(() {});
                                  },
                                  child: Text(
                                    categorySelection[index - 1]
                                        .subLeaves![rowIndex]
                                        .name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
