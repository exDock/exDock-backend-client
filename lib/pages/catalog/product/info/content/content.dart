import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:flutter/material.dart';

import '../../../../../globals/styling.dart';

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

  @override
  Widget build(BuildContext context) {
    shortDescriptionController.value = TextEditingValue(
      text: widget.contentData.shortDescription,
    );
    descriptionController.value = TextEditingValue(
      text: widget.contentData.description,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: kBoxShadowList,
        color: Colors.white,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 1200,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 3, top: 8),
                  child: Text(
                    "Content",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: shortDescriptionController,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text("description WYSIWYG editor"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
