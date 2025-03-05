import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/header/category_edit_header_switches.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/header/category_edit_title.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/header/save_category_changes.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_save_button.dart';
import 'package:flutter/material.dart';

class CategoryEditHeader extends StatefulWidget {
  const CategoryEditHeader({
    super.key,
    required this.categorySelection,
    required this.changeAttributeMap,
    required this.mainSetState,
  });

  final List<CategoryLeaf> categorySelection;
  final MapNotifier changeAttributeMap;
  final Function(Function()) mainSetState;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: CategoryEditTitle(
                  categorySelection: widget.categorySelection,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ExDockSaveButton(
                // somethingToSaveNotifier:
                // ValueNotifier<bool>(widget.changeAttributeMap.isEmpty),
                somethingToSaveNotifier: widget.changeAttributeMap,
                onPressed: () async {
                  saveCategoryChanges(
                    widget.changeAttributeMap,
                    widget.mainSetState,
                  );
                  setState(() {});
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: CategoryEditHeaderSwitches(),
            ),
          ],
        ),
      ),
    );
  }
}
