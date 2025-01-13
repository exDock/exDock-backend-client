import 'package:flutter/material.dart';

import '../../../../../globals/styling.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Widget> categoryWidgets = [];

  @override
  Widget build(BuildContext context) {
    categoryWidgets = [];

    for (String categoryName in widget.categories) {
      categoryWidgets.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: kBoxShadowList,
          color: Colors.white,
        ),
        child: Row(
          children: [
            Text(categoryName),
            Icon(Icons.close),
          ],
        ),
      ));
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: kBoxShadowList,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Icon(Icons.category_outlined),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 2,
                  child: Text("Categories"),
                ),
                Expanded(
                  flex: 16,
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            child: Wrap(
              spacing: 10,
              runSpacing: 5,
              direction: Axis.horizontal,
              children: categoryWidgets,
            ),
          ),
        ],
      ),
    );
  }
}
