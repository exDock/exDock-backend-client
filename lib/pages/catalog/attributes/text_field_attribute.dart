import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/widgets/exdock_card.dart';
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
  Widget build(BuildContext context) {
    return ExdockCard(
      height: 56,
      child: TextField(
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
        style: TextStyle(fontSize: 14, height: 1.5),
        decoration: InputDecoration(
          labelText: widget.attribute["attribute_name"] ??
              widget.attribute["attribute_id"],
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.blue,
        ),
      ),
    );
  }
}
