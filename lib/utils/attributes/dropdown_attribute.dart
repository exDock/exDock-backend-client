import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

class DropdownAttribute extends StatelessWidget {
  const DropdownAttribute({
    super.key,
    required this.attribute,
    required this.changeAttributeMap,
  });

  final Map<String, dynamic> attribute;
  final MapNotifier changeAttributeMap;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = List.from(
      attribute['possible_values'].map(
        (Map<String, String> value) {
          return DropdownMenuItem<String>(
            value: value['value'],
            child: Text(value['label'] ?? value['value'] ?? '-'),
          );
        },
      ),
    );

    return DropdownButtonFormField2(
      onChanged: (value) {
        if (value == attribute['current_attribute_value']) {
          changeAttributeMap.removeEntry(attribute['attribute_id']);
          return;
        }
        changeAttributeMap.addEntry(attribute['attribute_id'], value);
      },
      value: attribute['current_attribute_value'],
      items: items,
    );
  }
}
