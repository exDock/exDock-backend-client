import 'package:exdock_backend_client/pages/catalog/attributes/images/single_image_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/attributes/text_field_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/attributes/text_field_number_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/attributes/text_field_price_attribute.dart';
import 'package:exdock_backend_client/pages/catalog/attributes/wysiwyg_attribute.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';
import 'package:flutter/material.dart';

class GenerateAttribute extends StatelessWidget {
  const GenerateAttribute(
      {super.key, required this.attribute, required this.changeAttributeMap});

  final Map<String, dynamic> attribute;
  final MapNotifier changeAttributeMap;

  @override
  Widget build(BuildContext context) {
    if (attribute["attribute_type"] == "text") {
      return TextFieldAttribute(
        attribute: attribute,
        changeAttributeMap: changeAttributeMap,
      );
    }
    if (attribute["attribute_type"] == "wysiwyg") {
      return WysiwygAttribute(
        attribute: attribute,
        changeAttributeMap: changeAttributeMap,
      );
    }
    if (attribute["attribute_type"] == "image") {
      return SingleImageAttribute(
        attribute: attribute,
        changeAttributeMap: changeAttributeMap,
      );
    }
    if (attribute["attribute_type"] == "price") {
      return TextFieldPriceAttribute(
        attribute: attribute,
        changeAttributeMap: changeAttributeMap,
      );
    }
    if (attribute["attribute"] == "number") {
      return TextFieldNumberAttribute(
        attribute: attribute,
        changeAttributeMap: changeAttributeMap,
      );
    }
    return Text(
      "attribute_type not recognised: ${attribute["attribute_type"]}",
    );
  }
}
