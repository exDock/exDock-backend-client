import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  const Content({
    super.key,
    required this.contentData,
    required this.changeNotifierState,
  });

  final ContentData contentData;
  final Function changeNotifierState;

  @override
  State<Content> createState() => ContentState();
}

class ContentState extends State<Content> {
  FleatherController? fleatherDescriptionController;
  FleatherController? fleatherShortDescriptionController;

  @override
  Widget build(BuildContext context) {
    checkIfChanged() {
      if (fleatherDescriptionController!.plainTextEditingValue.text !=
              widget.contentData.description ||
          fleatherShortDescriptionController!.plainTextEditingValue.text !=
              widget.contentData.shortDescription) {
        widget.changeNotifierState(true, "content");
      } else {
        widget.changeNotifierState(false, "content");
      }
    }

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
                    if (focusNode.hasFocus) {
                      checkIfChanged();
                    }
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
                    if (focusNode.hasFocus) {
                      checkIfChanged();
                    }
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
