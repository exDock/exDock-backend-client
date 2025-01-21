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
          boxShadow: lightKBoxShadowList,
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
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: lightKBoxShadowList,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.category_outlined),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Categories"),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            direction: Axis.horizontal,
            children: categoryWidgets,
          ),
        ],
      ),
    );
  }
}
