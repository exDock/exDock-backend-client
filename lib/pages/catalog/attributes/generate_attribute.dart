import 'package:exdock_backend_client/pages/catalog/attributes/single_image_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/attributes/text_field_attribute.dart';
import 'package:flutter/material.dart';

class GenerateAttribute extends StatelessWidget {
  const GenerateAttribute({super.key, required this.attribute});

  final Map attribute;

  @override
  Widget build(BuildContext context) {
    if (attribute["attribute_type"] == "text") {
      // TODO: create text field attribute
      return TextFieldAttribute();
    }
    if (attribute["attribute_type"] == "wysiwyg") {
      // TODO: create wysiwyg attribute
    }
    if (attribute["attribute_type"] == "image") {
      return SingleImageAttribute();
    }
    return Text(
      "attribute_type not recognised: ${attribute["attribute_type"]}",
    );
  }
}
