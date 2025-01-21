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
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FleatherController fleatherDescriptionController = FleatherController();
  FleatherController fleatherShortDescriptionController = FleatherController();

  @override
  Widget build(BuildContext context) {
    shortDescriptionController.value = TextEditingValue(
      text: widget.contentData.shortDescription,
    );
    descriptionController.value = TextEditingValue(
      text: widget.contentData.description,
    );

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
                  controller: fleatherShortDescriptionController,
                ),
              ),
              Expanded(
                child: FleatherEditor(
                  controller: fleatherShortDescriptionController,
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
                  controller: fleatherDescriptionController,
                ),
              ),
              Expanded(
                child: FleatherEditor(
                  controller: fleatherDescriptionController,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
