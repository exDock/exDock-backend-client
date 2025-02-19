import 'package:exdock_backend_client/widgets/exdock_close_icon.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * .7,
      width: MediaQuery.of(context).size.width * .8,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category image [$scope]",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  // TODO: upload new image button
                  // TODO: search grid with all images that are currently on the server (paged)
                  // TODO: save button -> calls widget.onNewImage(image) with the url of the selected image
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: ExdockCloseIcon(onPressed: () {
              pop.dismiss(context);
            }),
          ),
        ],
      ),
    );
  }
}
