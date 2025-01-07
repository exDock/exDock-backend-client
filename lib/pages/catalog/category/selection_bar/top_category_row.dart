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

  static final ButtonStyle topCategoryRowButtonStyle = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    bool isSelected(int rowIndex) =>
        categorySelection.isNotEmpty &&
        categorySelection[0].id == categoryTree.leaves[rowIndex].id;

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
                  bool categoryIsSelected = isSelected(rowIndex);
                  return TextButton(
                    onPressed: () {
                      onPressed(rowIndex);
                    },
                    style: topCategoryRowButtonStyle,
                    child: Text(
                      categoryTree.leaves[rowIndex].name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color:
                                categoryIsSelected ? mainColour : Colors.white,
                            fontWeight: categoryIsSelected
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
