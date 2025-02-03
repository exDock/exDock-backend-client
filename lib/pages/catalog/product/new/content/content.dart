import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  const Content({
    super.key,
    required this.contentData,
  });

  final ContentData contentData;

  @override
  State<Content> createState() => ContentState();
}

class ContentState extends State<Content> {
  FleatherController? fleatherDescriptionController;
  FleatherController? fleatherShortDescriptionController;

  @override
  Widget build(BuildContext context) {
    var descriptionDocument = ParchmentDocument();
    var shortDescriptionDocument = ParchmentDocument();

    descriptionDocument.insert(0, widget.contentData.description);
    shortDescriptionDocument.insert(0, widget.contentData.shortDescription);

    fleatherDescriptionController =
        FleatherController(document: descriptionDocument);
    fleatherShortDescriptionController =
        FleatherController(document: shortDescriptionDocument);

    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FleatherToolbar.basic(
                  controller: fleatherShortDescriptionController!,
                ),
              ),
              Expanded(
                child: Focus(
                  onKeyEvent: (focusNode, keyEvent) {
                    return KeyEventResult.ignored;
                  },
                  child: FleatherEditor(
                    controller: fleatherShortDescriptionController!,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FleatherToolbar.basic(
                  controller: fleatherDescriptionController!,
                ),
              ),
              Expanded(
                child: Focus(
                  onKeyEvent: (focusNode, keyEvent) {
                    return KeyEventResult.ignored;
                  },
                  child: FleatherEditor(
                    controller: fleatherDescriptionController!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
