import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/widgets/exdock_card.dart';
import 'package:exdock_backend_client/widgets/input/exdock_text_field.dart';
import 'package:flutter/material.dart';

class TextFieldAttribute extends StatefulWidget {
  const TextFieldAttribute({
    super.key,
    required this.attribute,
    required this.changeAttributeMap,
  });

  final Map<String, dynamic> attribute;
  final MapNotifier changeAttributeMap;

  @override
  State<TextFieldAttribute> createState() => _TextFieldAttributeState();
}

class _TextFieldAttributeState extends State<TextFieldAttribute> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.attribute['current_attribute_value'] ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExdockTextField(
      controller: controller,
      onChanged: (value) {
        if (value == widget.attribute["current_attribute_value"]) {
          widget.changeAttributeMap.removeEntry(
            widget.attribute["attribute_id"],
          );
          return;
        }
        widget.changeAttributeMap.addEntry(
          widget.attribute["attribute_id"],
          value,
        );
      },
      labelText: widget.attribute["attribute_name"] ??
          widget.attribute["attribute_id"],
    );
  }
}
