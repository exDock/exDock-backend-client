import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:flutter/material.dart';

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
