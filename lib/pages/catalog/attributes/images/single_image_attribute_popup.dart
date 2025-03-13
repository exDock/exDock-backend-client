import 'package:exdock_backend_client/widgets/popup/exdock_big_popup.dart';
import 'package:flutter/material.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

class SingleImageAttributePopup extends StatelessWidget {
  const SingleImageAttributePopup({
    super.key,
    required this.pop,
    required this.scope,
    required this.currentImage,
    required this.onNewImage,
  });

  final KumiPopupWindow pop;
  final String scope;
  final String? currentImage;
  final Function(String?) onNewImage;

  @override
  Widget build(BuildContext context) {
    return ExdockBigPopup(
      pop: pop,
      title: "Category image [$scope]",
      child: const Placeholder(),
      // TODO: upload new image button
      // TODO: search grid with all images that are currently on the server (paged)
      // TODO: save button -> calls widget.onNewImage(image) with the url of the selected image
    );
  }
}
