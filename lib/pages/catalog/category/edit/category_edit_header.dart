import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class CategoryEditHeader extends StatefulWidget {
  const CategoryEditHeader({super.key});

  @override
  State<CategoryEditHeader> createState() => _CategoryEditHeaderState();
}

class _CategoryEditHeaderState extends State<CategoryEditHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 104,
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        boxShadow: kBoxShadowList,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Placeholder(),
          ),
          Flexible(
            flex: 1,
            child: Placeholder(),
          ),
          Flexible(
            flex: 4,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
