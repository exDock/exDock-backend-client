import 'package:exdock_backend_client/widgets/popup/exdock_big_popup.dart';
import 'package:flutter/material.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

class EditCategoryStructurePopup extends StatelessWidget {
  const EditCategoryStructurePopup({super.key, required this.pop});

  final KumiPopupWindow pop;

  @override
  Widget build(BuildContext context) {
    return ExdockBigPopup(
      pop: pop,
      title: "Edit category structure",
      child: Placeholder(),
    );
  }
}
